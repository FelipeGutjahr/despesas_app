import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      widthFactor: 1,
      child: Container(
        width: 1000,
        child: Scaffold(
          backgroundColor: Colors.white,
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => Modular.to.pushNamed('/nova_despesa'),
          ),
          body: Center(child: Text('HOME'))
        ),
      ),
    );
  }
}