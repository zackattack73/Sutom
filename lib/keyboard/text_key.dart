import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sutom/data_store.dart';
import 'package:sutom/utils.dart';

class TextKey extends StatelessWidget {
  const TextKey({
    Key? key,
    @required this.text,
    this.onTextInput,
    this.flex = 1,
  }) : super(key: key);

  final String? text;
  final ValueSetter<String>? onTextInput;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Material(
          color: getLetterColor(context,text!),
          child: InkWell(
            onTap: () {
              onTextInput?.call(text!);
            },
            child: Center(child: Text(text!,style: const TextStyle(color: Colors.white),)),
          ),
        ),
      ),
    );
  }

  getLetterColor(BuildContext context,String letter) {
    if(Provider.of<DataStore>(context, listen: false).redLetters.contains(letter)) {
      return redColor;
    } else if(Provider.of<DataStore>(context, listen: false).yellowLetters.contains(letter)) {
      return yellowColor;
    } else if(Provider.of<DataStore>(context, listen: false).greyLetters.contains(letter)) {
      return greyColor;
    } else {
      return Colors.black;
    }
  }
}