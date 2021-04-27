import 'package:despesas_app/app/pages/settings/settings_controller.dart';
import 'package:despesas_app/app/utils/custon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _controller = Modular.get<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Ajustes'),
      ),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
            width: 750,
            alignment: Alignment.topCenter,
            padding: EdgeInsets.symmetric(vertical: 38.0),
            child: Observer(builder: (_) {
              return _controller.getLoadingData
                  ? CircularProgressIndicator()
                  : Column(
                      children: [
                        _getPerfilImage(),
                        SizedBox(height: 28.0),
                        _getUserInformation(),
                        SizedBox(height: 38.0),
                        _getSwitchListTileMes(context),
                        _getSwitchListTileDark()
                      ],
                    );
            })),
      ),
    );
  }

  Widget _getPerfilImage() {
    return CircleAvatar(
        backgroundColor: Colors.black54,
        backgroundImage: AssetImage('images/login_image.jpg'),
        radius: 50);
  }

  Widget _getUserInformation() {
    return Column(
      children: [
        Text('Bem vindo, ${_controller.usuarioModel.nome}',
            style: TextStyle(fontSize: 32)),
        Text(_controller.usuarioModel.email, style: TextStyle(fontSize: 22))
      ],
    );
  }

  Widget _getSwitchListTileMes(BuildContext context) {
    return Observer(builder: (_) {
      return Column(
        children: [
          SwitchListTile(
            title: Text('Inicio do mês customizado'),
            subtitle: Text(
                'Ative para definir em qual dia o mês financeiro iniciará. Com a configurção desativada o mês inicia primeiro dia do mês'),
            value: _controller.getCustonDayMonth,
            onChanged: (value) => _controller.changeCustonDayMonth(),
          ),
          SizedBox(height: 8.0),
          _controller.getCustonDayMonth
              ? _getFieldCustonDayMonth(context)
              : Container()
        ],
      );
    });
  }

  Widget _getFieldCustonDayMonth(BuildContext context) {
    return Observer(builder: (_) {
      return CustonWidget.getTextFormField(
          context: context,
          initialValue: _controller
              .usuarioModel.usuarioConfigModel.primeiroDiaMes
              .toString(),
          hintText: 'Primeiro dia do mês',
          enabled: !_controller.getBusy);
    });
  }

  Widget _getSwitchListTileDark() {
    return Observer(builder: (_) {
      return Column(
        children: [
          SwitchListTile(
            title: Text('Tema escuro'),
            value: _controller.getCustonDayMonth,
            onChanged: (value) => _controller.changeCustonDayMonth(),
          ),
        ],
      );
    });
  }
}
