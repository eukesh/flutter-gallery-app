import 'package:flutter/material.dart';
import 'package:projeto_final/view/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Galeria de Imagens',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      home: TelaInicial(),
    );
  }
}

// TELA INICIAL, _tela extrair em uma classe
// editar as classes BD e a classe IMAGEAPP
