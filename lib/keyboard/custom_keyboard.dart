import 'package:flutter/material.dart';
import 'package:sutom/keyboard/backspace_key.dart';
import 'package:sutom/keyboard/submit_key.dart';
import 'package:sutom/keyboard/text_key.dart';

class CustomKeyboard extends StatelessWidget {
  const CustomKeyboard({
    Key? key,
    this.onTextInput,
    this.onBackspace,
    this.onSubmit,
  }) : super(key: key);

  final ValueSetter<String>? onTextInput;
  final VoidCallback? onBackspace;
  final VoidCallback? onSubmit;

  void _textInputHandler(String text) => onTextInput?.call(text);

  void _backspaceHandler() => onBackspace?.call();

  void _submitHandler() => onSubmit?.call();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      color: Colors.blue,
      child: Column(
        children: [
          buildRowOne(),
          buildRowTwo(),
          buildRowThree(),
        ],
      ),
    );
  }

  Expanded buildRowOne() {
    return Expanded(
      child: Row(
        children: [
          TextKey(
            text: 'A',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'Z',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'E',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'R',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'T',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'Y',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'U',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'I',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'O',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'P',
            onTextInput: _textInputHandler,
          ),
        ],
      ),
    );
  }
  Expanded buildRowTwo() {
    return Expanded(
      child: Row(
        children: [
          TextKey(
            text: 'Q',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'S',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'D',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'F',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'G',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'H',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'J',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'K',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'L',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'M',
            onTextInput: _textInputHandler,
          ),
        ],
      ),
    );
  }

  Expanded buildRowThree() {
    return Expanded(
      child: Row(
        children: [
          TextKey(
            text: 'W',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'X',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'C',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'V',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'B',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'N',
            onTextInput: _textInputHandler,
          ),
          BackspaceKey(
            flex : 2,
            onBackspace: _backspaceHandler,
          ),
          SubmitKey(
            flex : 2,
            onSubmit: _submitHandler,
          ),
        ],
      ),
    );
  }
}
