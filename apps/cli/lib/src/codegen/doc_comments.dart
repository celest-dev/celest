// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

import 'package:html2md/html2md.dart' as html2md;

String? docsFromParts(String? summary, String? description) {
  if (summary == null && description == null) {
    return null;
  }
  final docs = StringBuffer();
  if (summary != null) {
    docs.write(formatDocs(summary));
    if (description != null) {
      docs
        ..writeln()
        ..writeln('///');
    }
  }
  if (description != null) {
    docs.write(formatDocs(description));
  }
  return docs.toString();
}

/// Formats documentation to follow Dart standards.
String formatDocs(String docs) {
  final lines =
      html2md
          .convert(
            docs,
            rules: [
              // Format <fullname> as H1
              html2md.Rule(
                'fullname',
                filters: ['fullname'],
                replacement: (text, node) {
                  return '## $text\n\n';
                },
              ),

              // Format <p> with line breaks
              html2md.Rule(
                'p',
                filters: ['p'],
                replacement: (text, node) {
                  return '$text\n\n';
                },
              ),
            ],
          )
          .split('\n')
          .map((doc) => doc.replaceFirst(RegExp(r'^/*'), ''))
          // unescape pre-convert MD
          .map((doc) => doc.replaceAll(r'\*', '*').replaceAll(r'\.', '.'))
          .toList();

  // Empty lines are not needed
  if (lines.isNotEmpty && lines.first.trim().isEmpty) {
    lines.removeAt(0);
  }
  if (lines.isNotEmpty && lines.last.trim().isEmpty) {
    lines.removeLast();
  }

  return lines.map((doc) => '/// $doc'.trim()).join('\n');
}
