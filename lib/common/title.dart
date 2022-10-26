import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  String text = "";
  CustomTitle({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,
      style: TextStyle(
          color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20),
    );
  }
}
