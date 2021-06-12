import 'package:flutter/material.dart';

class Button1 extends StatelessWidget {

  final Function onPressed;
  final String name;

  Button1({required this.name, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125,
      child: RaisedButton(
        color: Colors.grey,
        child: Text(name),
        onPressed: () {
          onPressed;
        },
      ),
    );
  }
}
