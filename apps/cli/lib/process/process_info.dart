// Mostly copied from dartdev
// https://github.com/dart-lang/sdk/blob/904c8c2c39bf19841fb0fb1f4f527d9d42fee7f3/pkg/dartdev/lib/src/processes.dart

import 'dart:convert';

import 'package:celest_cli/src/utils/error.dart';
import 'package:celest_cli_common/celest_cli_common.dart';
import 'package:logging/logging.dart';

final class Processes {
  Processes._(this._processes);

  Processes._empty() : _processes = const [];

  static final _logger = Logger('Processes');

  static Future<Processes> load() async {
    return switch (platform.operatingSystem) {
      'macos' || 'linux' => _loadUnix(),
      'windows' => _loadWindows(),
      _ => unreachable(),
    };
  }

  static Future<Processes> _loadUnix() async {
    final portInfoRes = await processManager.run(
      [
        if (platform.environment.containsKey('CI')) 'sudo',
        'lsof',
        '-nP',
        '-iTCP',
        '-sTCP:LISTEN',
      ],
      stdoutEncoding: utf8,
      stderrEncoding: utf8,
    );
    if (portInfoRes.exitCode != 0) {
      _logger.finer(
        'Failed to get port info: ${portInfoRes.stdout}\n${portInfoRes.stderr}',
      );
      return Processes._empty();
    }
    final portInfo = Map.fromEntries(
      LineSplitter.split(portInfoRes.stdout as String)
          .skip(1)
          .map((line) => line.trim())
          .where((line) => line.isNotEmpty)
          .map(_PortInfo.parseUnix)
          .where((portInfo) => portInfo.port != -1)
          .map((portInfo) => MapEntry(portInfo.pid, portInfo.port))
          .toList(),
    );
    final processesRes = await processManager.run(
      [
        if (platform.environment.containsKey('CI')) 'sudo',
        'ps',
        '-ef',
      ],
      stdoutEncoding: utf8,
      stderrEncoding: utf8,
    );
    if (processesRes.exitCode != 0) {
      _logger.finer(
        'Failed to get processes: ${processesRes.stdout}\n${processesRes.stderr}',
      );
      return Processes._empty();
    }
    final processes = LineSplitter.split(processesRes.stdout as String)
        .skip(1)
        .map((line) => line.trim())
        .where((line) => line.isNotEmpty)
        .map((line) => ProcessInfo.parseUnix(line, portInfo))
        .toList();
    return Processes._(processes);
  }

  static Future<Processes> _loadWindows() async {
    final portInfoRes = await processManager.run(
      ['netstat', '-a', '-n', '-o'],
      stdoutEncoding: utf8,
      stderrEncoding: utf8,
    );
    final portInfo = Map.fromEntries(
      LineSplitter.split(portInfoRes.stdout as String)
          .map((line) => line.trim())
          .where((line) => line.startsWith('TCP'))
          .map(_PortInfo.parseWindows)
          .nonNulls
          .where((portInfo) => portInfo.port != -1)
          .map((portInfo) => MapEntry(portInfo.pid, portInfo.port))
          .toList(),
    );
    final processesRes = await processManager.run(
      ['WMIC', 'path', 'win32_process', 'get', 'Processid,Commandline'],
      stdoutEncoding: utf8,
      stderrEncoding: utf8,
    );
    if (processesRes.exitCode != 0) {
      _logger.finer(
        'Failed to get processes: ${processesRes.stdout}\n${processesRes.stderr}',
      );
      return Processes._empty();
    }
    final processes = LineSplitter.split(processesRes.stdout as String)
        .skip(1)
        .map((line) => line.trim())
        .where((line) => line.isNotEmpty)
        .map((line) => ProcessInfo.parseWindows(line, portInfo))
        .nonNulls
        .toList();
    return Processes._(processes);
  }

  final List<ProcessInfo> _processes;

  late final Map<int, ProcessInfo> byPort = {
    for (final process in _processes)
      if (process.port case final port?) port: process,
  };
  late final Map<int, ProcessInfo> byPid = {
    for (final process in _processes) process.pid: process,
  };
}

final class ProcessInfo {
  const ProcessInfo._({
    required this.pid,
    required this.command,
    required this.commandLine,
    required this.port,
  });

  final int pid;
  final String command;
  final String commandLine;
  final int? port;

  bool get isCelest => commandLine.contains('celest');

  static ProcessInfo parseUnix(String line, Map<int, int> portInfo) {
    // 501 59214   758   0 11:52AM ttys002    0:00.00 grep celest
    line = line.replaceAll(_whitespace, ' ');

    String nextWord() {
      final index = line.indexOf(' ');
      final word = line.substring(0, index);
      line = line.substring(index + 1);
      return word;
    }

    nextWord(); // uid
    final pid = int.parse(nextWord());
    nextWord(); // parentPid
    nextWord(); // cpu
    nextWord(); // startTime
    nextWord(); // tty
    nextWord(); // elapsedTime
    final commandLine = line.trim();

    return ProcessInfo._(
      pid: pid,
      command: _getCommandFrom(commandLine),
      commandLine: commandLine,
      port: portInfo[pid],
    );
  }

  static ProcessInfo? parseWindows(String line, Map<int, int> portInfo) {
    // 640
    // winlogon.exe 712
    // C:\Windows\System32\svchost.exe -k LocalSystemNetworkRestricted -p -s NcbService 1136
    line = line.replaceAll(_whitespace, ' ');

    final parts = line.split(' ');
    final pid = int.parse(parts.removeLast());
    final command = parts.isEmpty ? '' : parts.removeAt(0);
    final commandLine = '$command ${parts.join(' ')}';

    return ProcessInfo._(
      pid: pid,
      command: command,
      commandLine: commandLine,
      port: portInfo[pid],
    );
  }

  @override
  String toString() {
    final buf = StringBuffer();
    buf.write('pid: $pid, ');
    if (port != null) {
      buf.write('port: $port, ');
    }
    buf.write('command: $commandLine');
    return buf.toString();
  }
}

final class _PortInfo {
  const _PortInfo({
    required this.pid,
    required this.port,
  });

  final int pid;
  final int port;

  static _PortInfo parseUnix(String line) {
    // rapportd    407 dillonnys    9u  IPv4 0xc74632764e253baf      0t0  TCP *:49152 (LISTEN)
    line = line.replaceAll(_whitespace, ' ');

    String nextWord() {
      final index = line.indexOf(' ');
      final word = line.substring(0, index);
      line = line.substring(index + 1);
      return word;
    }

    nextWord(); // command
    final pid = int.parse(nextWord());
    nextWord(); // user
    nextWord(); // fd
    nextWord(); // type
    nextWord(); // device
    nextWord(); // size
    final node = nextWord();
    assert(node == 'TCP');

    // *:49152
    // 127.0.0.1:49153
    // [::1]:8888
    final rawPortMap = nextWord();
    final portSeparator = rawPortMap.lastIndexOf(':');
    final address = rawPortMap.substring(0, portSeparator);
    final rawPort = rawPortMap.substring(portSeparator + 1);
    final port = switch (address) {
      '0.0.0.0' || '127.0.0.1' || '*' || '[::1]' => int.parse(rawPort),
      _ => -1,
    };

    return _PortInfo(
      pid: pid,
      port: port,
    );
  }

  static _PortInfo? parseWindows(String line) {
    // TCP    0.0.0.0:135            0.0.0.0:0              LISTENING       824
    line = line.replaceAll(_whitespace, ' ');

    String nextWord() {
      final index = line.indexOf(' ');
      final word = line.substring(0, index);
      if (index + 1 < line.length) {
        line = line.substring(index + 1);
      } else {
        line = '';
      }
      return word;
    }

    final protocol = nextWord();
    assert(protocol == 'TCP');
    final rawPortMap = nextWord();
    final portSeparator = rawPortMap.lastIndexOf(':');
    final address = rawPortMap.substring(0, portSeparator);
    final rawPort = rawPortMap.substring(portSeparator + 1);
    final port = switch (address) {
      '0.0.0.0' || '127.0.0.1' || '*' || '[::1]' => int.parse(rawPort),
      _ => -1,
    };
    nextWord(); // foreign address

    // state can be empty. always followed by port.
    final stateOrPid = nextWord();
    final pid = int.tryParse(stateOrPid) ?? int.parse(line.trim());

    return _PortInfo(pid: pid, port: port);
  }
}

final _whitespace = RegExp(r'\s+');

String _getCommandFrom(String commandLine) {
  final command = commandLine.split(' ').first;
  return command.split(platform.pathSeparator).last;
}
