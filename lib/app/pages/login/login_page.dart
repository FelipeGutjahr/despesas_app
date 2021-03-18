import 'package:despesas_app/app/pages/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatelessWidget {

  final controller = Modular.get<LoginController>();

  get context => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('images/login_image.jpg'),
            fit: BoxFit.cover
          ),
        ),
        child: Center(
          widthFactor: 1,
          child: Container(
            width: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('DESPESAS', style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white)),
                SizedBox(height: 20),
                getForm(),
              ],
            ),
          ),
        )
      ),
    );
  }

  Widget getForm(){
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          getFieldEmail(),
          SizedBox(height: 20),
          getFieldSenha(),
          SizedBox(height: 20),
          getBtnEntrar()
        ],
      ),
    );
  }

  Widget getFieldEmail(){
    return Container(
      height: 48,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.circular(32)
      ),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'E-mail',
          border: InputBorder.none,
          prefixIcon: Icon(Icons.mail_outline)
        ),
        textAlignVertical: TextAlignVertical.center,
        onEditingComplete: (){FocusScope.of(context).requestFocus(controller.senhaFocus);},
        keyboardType: TextInputType.emailAddress, 
        onChanged: (value){
          if(controller.getWithErrorEmail) {
            controller.changeWithErrorEmail();
          }
        },
        validator: (value){
          if((value.isEmpty || !value.contains('@')) && !controller.getWithErrorEmail){
            controller.changeWithErrorEmail();
          }
          return null;
        },
        onSaved: ((val){
          controller.loginModel.email = val;
        }),
      ),
    );
  }

  Widget getFieldSenha(){
    return Container(
      height: 48,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.circular(32)
      ),
      child: Observer(
        builder: (_){
          return TextFormField(
            focusNode: controller.senhaFocus,
            obscureText: controller.getObscurePassword,
            decoration: InputDecoration(
              hintText: 'Senha',
              border: InputBorder.none,
              prefixIcon: Icon(Icons.lock_outline),
              suffixIcon: IconButton(
                icon: Icon(controller.getObscurePassword ? Icons.visibility : Icons.visibility_off),
                onPressed: (){controller.changeObscure();},
              )
            ),
            textAlignVertical: TextAlignVertical.center,
            keyboardType: TextInputType.visiblePassword,
            onChanged: (value){
              if(controller.getWithErrorSenha) {
                controller.changeWithErrorSenha();
              }
            },
            validator: (value){
              if(value.isEmpty && !controller.getWithErrorSenha){
                controller.changeWithErrorSenha();
              }
              return null;
            },
            onSaved: ((val){
              controller.loginModel.senha = val;
            }),
          );
        }
      ),
    );
  }

  Widget getBtnEntrar(){
    return Container(
      height: 48,
      child: Observer(
        builder: (_){
          return ElevatedButton(
            child: controller.getBusy
              ? CircularProgressIndicator(valueColor: const AlwaysStoppedAnimation<Color>(Colors.white)) 
              : Text('ENTRE'),
            onPressed: () => controller.getBusy ? null : controller.logar(context)
          );
        },
      ),
    );
  }
}