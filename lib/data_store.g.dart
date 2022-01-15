// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DataStore on Data, Store {
  Computed<int>? _$currentWordLengthComputed;

  @override
  int get currentWordLength => (_$currentWordLengthComputed ??= Computed<int>(
          () => super.currentWordLength,
          name: 'Data.currentWordLength'))
      .value;
  Computed<int>? _$colComputed;

  @override
  int get col =>
      (_$colComputed ??= Computed<int>(() => super.col, name: 'Data.col'))
          .value;

  final _$currentRowAtom = Atom(name: 'Data.currentRow');

  @override
  int get currentRow {
    _$currentRowAtom.reportRead();
    return super.currentRow;
  }

  @override
  set currentRow(int value) {
    _$currentRowAtom.reportWrite(value, super.currentRow, () {
      super.currentRow = value;
    });
  }

  final _$currentColumnAtom = Atom(name: 'Data.currentColumn');

  @override
  int get currentColumn {
    _$currentColumnAtom.reportRead();
    return super.currentColumn;
  }

  @override
  set currentColumn(int value) {
    _$currentColumnAtom.reportWrite(value, super.currentColumn, () {
      super.currentColumn = value;
    });
  }

  final _$currentWordAtom = Atom(name: 'Data.currentWord');

  @override
  String get currentWord {
    _$currentWordAtom.reportRead();
    return super.currentWord;
  }

  @override
  set currentWord(String value) {
    _$currentWordAtom.reportWrite(value, super.currentWord, () {
      super.currentWord = value;
    });
  }

  final _$rowAtom = Atom(name: 'Data.row');

  @override
  int get row {
    _$rowAtom.reportRead();
    return super.row;
  }

  @override
  set row(int value) {
    _$rowAtom.reportWrite(value, super.row, () {
      super.row = value;
    });
  }

  final _$gameTableAtom = Atom(name: 'Data.gameTable');

  @override
  List<List<Case>> get gameTable {
    _$gameTableAtom.reportRead();
    return super.gameTable;
  }

  @override
  set gameTable(List<List<Case>> value) {
    _$gameTableAtom.reportWrite(value, super.gameTable, () {
      super.gameTable = value;
    });
  }

  final _$initGameAsyncAction = AsyncAction('Data.initGame');

  @override
  Future<dynamic> initGame() {
    return _$initGameAsyncAction.run(() => super.initGame());
  }

  final _$getRandomWordFromDicoAsyncAction =
      AsyncAction('Data.getRandomWordFromDico');

  @override
  Future<dynamic> getRandomWordFromDico() {
    return _$getRandomWordFromDicoAsyncAction
        .run(() => super.getRandomWordFromDico());
  }

  final _$populateCurrentRowAsyncAction =
      AsyncAction('Data.populateCurrentRow');

  @override
  Future<dynamic> populateCurrentRow() {
    return _$populateCurrentRowAsyncAction
        .run(() => super.populateCurrentRow());
  }

  final _$onLetterPressedAsyncAction = AsyncAction('Data.onLetterPressed');

  @override
  Future<dynamic> onLetterPressed(String letter) {
    return _$onLetterPressedAsyncAction
        .run(() => super.onLetterPressed(letter));
  }

  final _$onBackspacePressedAsyncAction =
      AsyncAction('Data.onBackspacePressed');

  @override
  Future<dynamic> onBackspacePressed() {
    return _$onBackspacePressedAsyncAction
        .run(() => super.onBackspacePressed());
  }

  @override
  String toString() {
    return '''
currentRow: ${currentRow},
currentColumn: ${currentColumn},
currentWord: ${currentWord},
row: ${row},
gameTable: ${gameTable},
currentWordLength: ${currentWordLength},
col: ${col}
    ''';
  }
}
