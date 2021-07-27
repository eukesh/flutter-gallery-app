import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:projeto_final/controllers/controller.dart';
import 'package:projeto_final/model/image.dart';
import 'package:projeto_final/view/image_viewer.dart';

class ListItens extends StatefulWidget {
  ListItens(this.index, {Key? key}) : super(key: key);

  int? index;

  @override
  _ListItensState createState() => _ListItensState();
}

class _ListItensState extends State<ListItens> {
  Controller controller = Controller.instance;

  Future<void> carregar() async {
    return await controller.buscarBanco().whenComplete(() {
      setState(() {});
    });
  }

  _navega(BuildContext context, ImageApp b) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return TelaImagem(img: b);
    })).whenComplete(() async {
      await carregar();
    });
  }

  @override
  Widget build(BuildContext context) {
    try {
      return Container(
        padding: EdgeInsets.only(top: 10, right: 50, left: 50, bottom: 10),
        child: TextButton(
          style: ButtonStyle(
            side: MaterialStateProperty.all(
                BorderSide(width: 2, color: Colors.grey)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            )),
          ),
          onPressed: () {
            _navega(context, controller.imagens.elementAt(widget.index!));
          },
          child: Row(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  width: 100,
                  height: 100,
                  child: Image.memory(base64.decode(
                      controller.imagens.elementAt(widget.index!).img!)),
                ),
              ),
              Flexible(
                flex: 2,
                child: Center(
                  child: Container(
                    child: Column(
                      children: [
                        Text(
                          controller.imagens.elementAt(widget.index!).title!,
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        Text(
                          'Data: ' +
                              controller.imagens.elementAt(widget.index!).data!,
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        Text(
                          'Latitude: ' +
                              controller.imagens
                                  .elementAt(widget.index!)
                                  .latitude!,
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        Text(
                          'Longitude: ' +
                              controller.imagens
                                  .elementAt(widget.index!)
                                  .longitude!,
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } catch (e) {
      return Container();
    }
  }
}
