import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {

  String label;
  Function() onPressed;
   CustomTextButton({
    super.key,
    required this.label,
     required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: Theme.of(context).textTheme.titleSmall,
        ));
  }
}
