import 'package:codemod/codemod.dart';
import 'package:source_span/src/file.dart';
import 'package:analyzer/analyzer.dart';

class JsonNullSuggester extends GeneralizingAstVisitor
    with AstVisitingSuggestorMixin {
  @override
  void visitDeclaration(Declaration node) {
    super.visitDeclaration(node);
    final source = node.toSource();
    if (!source.startsWith('factory \w+\.fromJson')) {
      return;
    }
    // only working with function expressions for now
    final sourceSplit = source.split('=>');
    final functionDefinition = sourceSplit.first;
    final body = sourceSplit.sublist(1).join('=>');
    final stringBuffer = StringBuffer('$functionDefinition {\n');
    stringBuffer.writeln('''    if (json == null) {
        return null;
    }''');
    stringBuffer.writeln(body);
    yieldPatch(node.offset, node.end, stringBuffer.toString());
  }

  @override
  Iterable<Patch> generatePatches(SourceFile sourceFile) {
    return super.generatePatches(sourceFile);
  }
}
