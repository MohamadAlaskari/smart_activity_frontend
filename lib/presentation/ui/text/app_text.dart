import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarText extends StatelessWidget {
  const AppBarText({required this.text, super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
    );
  }
}

class ButtonsText extends StatelessWidget {
  const ButtonsText({required this.text, required this.color, super.key});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: 18, fontWeight: FontWeight.w500),
    );
  }
}

class DialogTitleText extends StatelessWidget {
  const DialogTitleText({required this.text, required this.color, super.key});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: 20, fontWeight: FontWeight.w500),
    );
  }
}
