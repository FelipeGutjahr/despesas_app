import 'package:flutter/material.dart';

class CollapsingListTile extends StatefulWidget {
  final String title;
  final IconData icon;

  const CollapsingListTile({Key key, @required this.title, @required this.icon})
      : super(key: key);

  @override
  _CollapsingListTileState createState() => _CollapsingListTileState();
}

class _CollapsingListTileState extends State<CollapsingListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        children: [Icon(widget.icon), SizedBox(width: 10), Text(widget.title)],
      ),
    );
  }
}
