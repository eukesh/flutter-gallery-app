import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projeto_final/controllers/controller.dart';
import 'package:projeto_final/model/bd.dart';
import 'package:projeto_final/model/image.dart';
import 'package:projeto_final/view/register_image.dart';
import 'package:projeto_final/view/list_itens.dart';

class TelaInicial extends StatefulWidget {
  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  ImagePicker picker = ImagePicker();
  Controller controller = Controller.instance;

  bool loading = true;

  @override
  void initState() {
    super.initState();
    BancoDeDados().openDb().whenComplete(carregar);
  }

  Future<void> carregar() async {
    return await controller.buscarBanco().whenComplete(() {
      setState(() {
        loading = false;
      });
    });
  }

  _tela() {
    return Column(
      children: [
        Expanded(
          child: Container(
            child: _home(),
          ),
        ),
      ],
    );
  }

  _home() {
    return ListView.builder(
      itemCount: controller.imagens.length,
      itemBuilder: (BuildContext context, int index) =>
          controller.imagens.isEmpty ? Container() : ListItens(index),
    );
  }

  _cameraButton() {
    return FloatingActionButton(
      onPressed: () => _savePicture(),
      child: Icon(Icons.camera_alt),
    );
  }

  _savePicture() async {
    final escolhida = await picker.pickImage(
        source: ImageSource.camera, maxHeight: 512, maxWidth: 512);
    final bytes = await escolhida!.readAsBytes();
    String x = base64.encode(bytes);

    setState(() {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return TelaCadastro(img: x);
      })).then((value) async {
        await carregar();
      });
      // controller.imagens.add(a);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Galeria de Imagens'),
        centerTitle: true,
      ),
      body: _tela(),
      floatingActionButton: _cameraButton(),
      //  floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
