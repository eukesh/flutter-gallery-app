import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:projeto_final/controllers/controller.dart';
import 'package:projeto_final/model/image.dart';
import 'package:projeto_final/view/home.dart';

class TelaImagem extends StatefulWidget {
  const TelaImagem({Key? key, required this.img}) : super(key: key);

  final ImageApp img;

  @override
  _TelaImagemState createState() => _TelaImagemState(this.img);
}

class _TelaImagemState extends State<TelaImagem> {
  _TelaImagemState(this.img);
  ImageApp img;
  Controller controller = Controller.instance;

  late final imagem;

  @override
  void initState() {
    super.initState();
    imagem = base64.decode(img.img!);
  }

  _removeImage() {
    controller.removeImage(this.img);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.img.title!),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                padding:
                    EdgeInsets.only(top: 10, right: 100, left: 100, bottom: 10),
                child: Center(
                  child: Text(
                    this.img.comment!,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: Container(
                child: Image.memory(imagem),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                padding:
                    EdgeInsets.only(top: 50, right: 100, left: 100, bottom: 10),
                child: TextButton(
                  style: ButtonStyle(
                    side: MaterialStateProperty.all(
                        BorderSide(width: 2, color: Colors.red)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    )),
                  ),
                  child: Text('Excluir'),
                  onPressed: () {
                    _removeImage();
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
