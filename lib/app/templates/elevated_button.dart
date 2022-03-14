import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  Widget child;
  void Function()? onPressed;
  AppElevatedButton({Key? key, required this.onPressed, required this.child }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: child,
    );
  }
}
