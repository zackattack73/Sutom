import 'package:flutter/material.dart';
import 'package:sutom/utils.dart';

class Case {
  late StateCase state;
  late String value;
  late Color color;

  Case(this.state, this.value) {
    switch(state) {
      case StateCase.ko :
        color = blueColor;
        break;
      case StateCase.ok :
        color = redColor;
        break;
      case StateCase.place :
        color = yellowColor;
        break;
      default :
        color = blueColor;
        break;
    }
  }
}

enum StateCase {
  ok,
  place,
  ko
}