import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:sutom/case.dart';
import 'package:sutom/dico/wordsToFind.dart';

part 'data_store.g.dart';

class DataStore = Data with _$DataStore;

abstract class Data with Store {
  @observable
  int currentRow = 0;

  @observable
  int currentColumn = 0;

  @observable
  String currentWord = "";

  @computed
  int get currentWordLength => currentWord.length;

  @observable
  int row = 6;

  @computed
  int get col => currentWordLength;

  @observable
  late List<List<Case>> gameTable = List.generate(row, (i) => List.filled(col, Case(StateCase.ko, "")), growable: false);

  // Keep found letters
  @observable
  List<String> currentDisplay = [];

  // Letters for keyboard
  @observable
  List<String> redLetters = [];

  @observable
  List<String> yellowLetters = [];

  @observable
  List<String> greyLetters = [];

  @observable
  String tempUsedLetters = "";

  @observable
  String textToDisplay = "";

  @observable
  bool isOver = false;

  @action
  // Init or reset game
  Future initGame() async {
    print("initGame()");
    currentRow = currentColumn = 0;
    currentWord = await getRandomWordFromDico();
    print("DEBUGLO $currentWord");
    textToDisplay = "";
    currentDisplay.clear();
    redLetters.clear();
    yellowLetters.clear();
    greyLetters.clear();
    isOver = false;

    gameTable = List.generate(row, (i) => List.filled(col, Case(StateCase.ko, "")), growable: false);
    gameTable[0][0] = Case(StateCase.ko, currentWord[0]);
    currentDisplay.add(currentWord[0]);
    populateCurrentRow();
  }

  @action
  // TODO
  Future getRandomWordFromDico() async {
    final _random = Random();
    return wordsToFind[_random.nextInt(wordsToFind.length)];
  }

  @action
  Future populateCurrentRow() async {
    print("populateCurrentRow()");
    int i = 1;
    while (i < row - 1) {
      i++;
      gameTable[currentRow][i].value = ".";
      if (currentRow > 0 && gameTable[currentRow - 1][i].state == StateCase.ok) {
        currentDisplay.add(gameTable[currentRow - 1][i].value);
      } else {
        currentDisplay.add(".");
      }
    }
  }

  @action
  Future onLetterPressed(String letter) async {
    print("onLetterPressed(letter $letter)");
    if (!isOver && currentColumn != col) {
      Case updatedCase = Case(StateCase.ko, letter.toUpperCase());
      gameTable[currentRow][currentColumn] = updatedCase;
      currentColumn++;
    }
  }

  @action
  Future onBackspacePressed() async {
    print("onBackspacePressed()");
    if (!isOver && currentColumn > 0) {
      currentColumn--;
      Case updatedCase = currentColumn == 0 ? Case(StateCase.ko, currentWord[0]) : Case(StateCase.ko, ".");
      gameTable[currentRow][currentColumn] = updatedCase;
    }
  }

  @action
  Future onSubmitPressed(BuildContext context) async {
    print("onSubmitPressed()");
    List<Case> answer = [];
    tempUsedLetters = "";
    if (!isOver && currentColumn == col) {
      textToDisplay = "";
      String submitWord = await getSubmitWord();
      print(submitWord);
      if (await isInDico(submitWord)) {
        int i = 0;
        while (i < submitWord.length) {
          if (submitWord[i] == currentWord[i]) {
            redLetters.add(submitWord[i]);
            answer.add(Case(StateCase.ok, submitWord[i]));
          } else if (countNbOccurLetter(submitWord[i]) > 0) {
            yellowLetters.add(submitWord[i]);
            answer.add(Case(StateCase.place, submitWord[i]));
          } else {
            greyLetters.add(submitWord[i]);
            answer.add(Case(StateCase.ko, submitWord[i]));
          }
          i++;
        }
        displayResults(answer);
      } else {
        textToDisplay = "Le mot $submitWord n'est pas dans le dictionnaire";
      }
    }
  }

  int countNbOccurLetter(String letter) {
    if (letter[0].allMatches(currentWord).isEmpty) {
      return 0;
    } else if (letter[0].allMatches(currentWord).isNotEmpty && letter[0].allMatches(currentWord).length > letter[0].allMatches(tempUsedLetters).length) {
      tempUsedLetters += letter[0];
      return 1;
    } else {
      return 0;
    }
  }

  @action
  Future displayResults(List<Case> answer) async {
    int i = 0;
    while (i < col) {
      Case updatedCase = Case(answer[i].state, answer[i].value);
      gameTable[currentRow][i] = updatedCase;
      // TODO MUSIC HERE
      i++;
    }
    if (await isWin()) {
      textToDisplay = "BRAVO !!!";
      isOver = true;
    } else {
      currentRow += 1;
      currentColumn = 0;
      if (currentRow == row) {
        textToDisplay = "Perdu. La solution était : $currentWord";
        isOver = true;
      } else {
        gameTable[currentRow][currentColumn] = Case(StateCase.ko, currentWord[0]);
        populateCurrentRow();
      }
    }
  }

  @action
  Future getSubmitWord() async {
    String submitWord = "";
    int i = 0;
    while (i < col) {
      submitWord += gameTable[currentRow][i].value;
      i++;
    }
    return submitWord;
  }

  @action
  Future isWin() async {
    bool isWin = true;
    int i = 0;
    while (i < col) {
      if (gameTable[currentRow][i].state != StateCase.ok) {
        isWin = false;
      }
      i++;
    }
    return isWin;
  }

  @action
  Future isInDico(String submitWord) async {
    return wordsToFind.contains(submitWord);
  }
}
