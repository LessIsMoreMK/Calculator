import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String content;
  final Function callback;
  final Color backgroundColor;
  final double width;

  const Button({
    this.content,
    this.callback,
    this.backgroundColor = Colors.black38,
    this.width = 75,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: SizedBox(
        width: width,
        height: 75,
        child: FlatButton(
          color: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          onPressed: () {
            callback(content);
          },
          child: Text(
            content,
          ),
        ),
      ),
    );
  }
}
