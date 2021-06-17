import 'package:flutter/material.dart';

class TopText extends StatelessWidget {
  const TopText({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('Bem-vindo ao aplicativo',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 48, color: Colors.white, shadows: [
          Shadow(blurRadius: 10, color: Colors.black54, offset: Offset(5, 5))
        ]));
  }
}
