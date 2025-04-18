import 'dart:convert';
import 'dart:io';

Future<void> main() async {
  final client = HttpClient();
  try {
    final request = await client.get('localhost', 9000, '/');
    final response = await request.close();
    if (response.statusCode != 200) {
      throw Exception('Failed to connect to server: ${response.statusCode}');
    }
    print('Server response: ${await response.transform(utf8.decoder).join()}');
  } finally {
    client.close(force: true);
  }
}
