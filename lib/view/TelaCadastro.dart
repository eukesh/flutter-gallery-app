import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:projeto_final/controllers/Controller.dart';
import 'package:intl/intl.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({Key? key, required this.img}) : super(key: key);

  final String img;

  @override
  _TelaCadastroState createState() => _TelaCadastroState(img);
}

class _TelaCadastroState extends State<TelaCadastro> {
  _TelaCadastroState(this.img);
  final String img;
  Controller controller = Controller.instance;

  late final imagem;

  TextEditingController titulo = TextEditingController();
  TextEditingController descricao = TextEditingController();

  DateTime data = DateTime.now();

  LocationData? local;
  StreamSubscription? inscricao;

  @override
  void initState() {
    super.initState();
    inscricao = Location.instance.onLocationChanged.listen((event) {
      setState(() {
        local = event;
      });
    });
    imagem = base64.decode(img);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova Foto'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 3,
              child: Container(
                padding: EdgeInsets.only(bottom: 15, top: 10),
                child: Image.memory(imagem), //_decode(this.img), antigo codigo
              ),
            ),
            Flexible(
              flex: 4,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Titulo',
                      ),
                      controller: titulo,
                      autofocus: true,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Descricao',
                      ),
                      controller: descricao,
                    ),
                  ),
                  ElevatedButton(
                    child: Text('Salvar'),
                    onPressed: () async {
                      await controller
                          .cadastrar(
                              titulo.text,
                              descricao.text,
                              this.img,
                              local!.latitude!.toStringAsFixed(2),
                              local!.longitude!.toStringAsFixed(2),
                              DateFormat('dd/MM/yyyy').format(data))
                          .whenComplete(() => Navigator.pop(context));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    inscricao!.cancel();
    super.dispose();
  }
}
