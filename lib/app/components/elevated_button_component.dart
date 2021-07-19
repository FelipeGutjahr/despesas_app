import 'package:flutter/material.dart';

class ElevatedButtonComponent extends StatefulWidget {
  final bool busy;
  final String text;
  final Function onPressed;
  const ElevatedButtonComponent(
      {Key key, this.busy, @required this.text, this.onPressed})
      : super(key: key);

  @override
  _ElevatedButtonComponentState createState() =>
      _ElevatedButtonComponentState();
}

class _ElevatedButtonComponentState extends State<ElevatedButtonComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: double.infinity,
      child: ElevatedButton(
        child: widget.busy
            ? CircularProgressIndicator(
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.white))
            : Text(widget.text, style: TextStyle(color: Colors.white)),
        onPressed: widget.busy ? null : widget.onPressed,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue[800]),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)))),
      ),
    );
    ;
  }
}
