import 'package:flutter/material.dart';
import 'package:task_mind/core/constants.dart';

class Info extends StatelessWidget {
  const Info({
    super.key,
    required this.txt,
    this.onPressed,
  });
  final String txt;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          txt,
        ),
        const Spacer(),
        SizedBox(
          height: 30,
          child: TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(0),
              backgroundColor: primaryColor,
            ),
            child: const Text(
              'المزيد',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
