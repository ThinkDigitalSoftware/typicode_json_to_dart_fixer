import 'package:meta/meta.dart';

class MapFixer {
  final String source;

  MapFixer(this.source) {
    process(source);
  }

  void process(String source) {}
}

class Span {
  final LineColumnOffset offset;
  final String source;

  Span({@required this.offset, @required this.source});
}

class LineColumnOffset {
  final int line;
  final int column;

  LineColumnOffset(this.line, this.column);
}
