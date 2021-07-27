import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:projeto_final/controllers/Controller.dart';
import 'package:projeto_final/model/ImageApp.dart';
import 'package:projeto_final/view/TelaImagem.dart';

class ListItens extends StatelessWidget {
  ListItens(this.index, {Key? key}) : super(key: key);

  Controller controller = Controller.instance;
  int? index;

  _navega(BuildContext context, ImageApp b) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return TelaImagem(img: b);
    }));
  }

  @override
  Widget build(BuildContext context) {
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
          _navega(context, controller.imagens.elementAt(index!));
        },
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                width: 100,
                height: 100,
                child: Image.memory(
                    base64.decode(controller.imagens.elementAt(index!).img!)),
              ),
            ),
            Flexible(
              flex: 2,
              child: Center(
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        controller.imagens.elementAt(index!).title!,
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      Text(
                        'Data: ' + controller.imagens.elementAt(index!).data!,
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      Text(
                        'Latitude: ' +
                            controller.imagens.elementAt(index!).latitude!,
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      Text(
                        'Longitude: ' +
                            controller.imagens.elementAt(index!).longitude!,
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
    ;
  }
}
