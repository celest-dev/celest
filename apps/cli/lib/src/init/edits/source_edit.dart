final class SourceEdit {
  const SourceEdit(this.offset, this.length, this.replacement);

  final int offset;
  final int length;
  final String replacement;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SourceEdit &&
        other.offset == offset &&
        other.length == length &&
        other.replacement == replacement;
  }

  @override
  int get hashCode => Object.hash(offset, length, replacement);

  @override
  String toString() {
    return 'SourceEdit(offset: $offset, length: $length, replacement: $replacement)';
  }
}
