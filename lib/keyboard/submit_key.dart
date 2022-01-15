import 'package:flutter/material.dart';

class SubmitKey extends StatelessWidget {
  const SubmitKey({
    Key? key,
    this.onSubmit,
    this.flex = 1,
  }) : super(key: key);

  final VoidCallback? onSubmit;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Material(
          color: Colors.black,
          child: InkWell(
            onTap: () {
              onSubmit?.call();
            },
            child: const Center(
                child: Icon(Icons.subdirectory_arrow_left,color: Colors.white,),
            ),
          ),
        ),
      ),
    );
  }
}