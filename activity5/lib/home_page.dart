import 'package:activity5/forage_list.dart';
import 'package:activity5/form_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Forage',
          style: TextStyle(fontSize: 18.0),
        ),
      ),
      body: ForageList(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => FormPage(refreshCallback: () {
                  setState(() {});
                }))),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        backgroundColor: Color.fromARGB(255, 33, 226, 243),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
