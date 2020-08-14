import 'dart:io';

import 'package:codemod/codemod.dart';
import 'package:typicode_json_fixer/json_null_suggestor.dart';
import 'package:typicode_json_fixer/typicode_json_fixer.dart'
    as typicode_json_fixer;

void main(List<String> arguments) {
  assert(arguments.isNotEmpty);
  exitCode =
      runInteractiveCodemod(arguments, JsonNullSuggester(), args: arguments);
}
