import 'package:embed_annotation/embed_annotation.dart';

part 'template.g.dart';

@EmbedStr('index.html')
const String indexHtml = _$indexHtml;

@EmbedStr('index.js')
const String indexJs = _$indexJs;
