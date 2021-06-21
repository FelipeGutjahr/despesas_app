import 'package:despesas_app/app/model/navigation_model.dart';
import 'package:despesas_app/app/pages/home/components/collapsing_list_tile.dart';
import 'package:flutter/material.dart';

class CollapsingNavigationDrawer extends StatefulWidget {
  const CollapsingNavigationDrawer({Key key}) : super(key: key);

  @override
  _CollapsingNavigationDrawerState createState() =>
      _CollapsingNavigationDrawerState();
}

class _CollapsingNavigationDrawerState
    extends State<CollapsingNavigationDrawer> {
  double maxWidth = 250;
  double minWidth = 70;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: Column(
        children: [
          SizedBox(height: 50),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, counter) {
                return CollapsingListTile(
                    title: navigationItens[counter].title,
                    icon: navigationItens[counter].icon);
              },
              itemCount: navigationItens.length,
            ),
          ),
        ],
      ),
    );
  }
}
