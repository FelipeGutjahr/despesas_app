import 'dart:math';

import 'package:despesas_app/app/pages/login/components/custon_form.dart';
import 'package:despesas_app/app/pages/login/components/top_text.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final imageNumber = Random().nextInt(4);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String pathImage =
        'assets/images/login_image_${imageNumber.toString()}.jpg';

    return Scaffold(
      body: GestureDetector(
        onTap: () => {FocusScope.of(context).unfocus()},
        child: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(pathImage), fit: BoxFit.cover)),
          child: Center(
            child: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [TopText(), SizedBox(height: 50), CustonForm()],
            )),
          ),
        ),
      ),
    );
  }
}
