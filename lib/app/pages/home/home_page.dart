import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('images/money_icon.png')
                )
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 10)),
            Text(
              'Despesas',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 28,
                fontWeight: FontWeight.bold
              )
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () => null,
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              backgroundColor: MaterialStateProperty.all(Colors.white)
            ),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('images/login_image.jpg')
                )
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(right: 10))
        ],
      ),
      body: Center(child: Text('HOME'))
    );
  }
}