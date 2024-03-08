import 'package:activity5/forage_provider.dart';
import 'package:activity5/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<ForageProvider>(
    create: (context) => ForageProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
            appBarTheme: AppBarTheme(
                backgroundColor: Color.fromARGB(255, 47, 25, 190),
                titleTextStyle: TextStyle(color: Colors.white))),
        home: HomePage());
  }
}
