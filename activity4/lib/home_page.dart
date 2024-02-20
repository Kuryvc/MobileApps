import 'dart:convert';

import 'package:crypto_look/crypt_list.dart';
import 'package:crypto_look/data/constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> misDatos = [
    "Azul",
    "Rojo",
    "Verde",
    "Morado",
    "Naraja",
    "Amarillo"
  ];

  List<dynamic> datos = [];

  @override
  void initState() {
    datos = jsonDecode(CRYPTO_EXCHANGES);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: CryptoList(datos: datos),
    );
  }
}
