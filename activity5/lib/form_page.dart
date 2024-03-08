import 'dart:ui';

import 'package:activity5/forage_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormPage extends StatefulWidget {
  final Function refreshCallback;

  const FormPage({super.key, required this.refreshCallback});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  // void printAllData() {
  //   print("I am in print");
  //   for (int i = 0; i < dataList.length; i++) {
  //     print('Map $i:');
  //     print('Name: ${dataList[i]['name']}');
  //     print('Location: ${dataList[i]['location']}');
  //     print('isInSeason: ${dataList[i]['isInSeason']}');
  //     print('Notes: ${dataList[i]['notes']}');
  //     print('------------------------');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Forage Form Page",
        style: TextStyle(fontSize: 18.0),
      )),
      body: Center(
        child: ListView(
          children: [
            SizedBox(
              height: 40.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 45.0, right: 45.0, bottom: 12.0),
              child: TextField(
                controller: context.watch<ForageProvider>().getName,
                decoration: InputDecoration(
                    labelText: "Name",
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 15.0),
                    filled: true,
                    fillColor: Color.fromARGB(255, 230, 227, 227)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 45.0, right: 45.0, bottom: 12.0),
              child: TextField(
                controller: context.watch<ForageProvider>().getLocation,
                decoration: InputDecoration(
                    labelText: "Location",
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 15.0),
                    filled: true,
                    fillColor: Color.fromARGB(255, 230, 227, 227)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 45.0, right: 45.0, bottom: 12.0),
              child: Row(
                children: [
                  Checkbox(
                    value: context.watch<ForageProvider>().getInSeason,
                    onChanged: (bool? value) {
                      // This function will be called when the checkbox is toggled
                      context.read<ForageProvider>().isInSeason(value);
                    },
                  ),
                  Text("Currently in Season")
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 45.0, right: 45.0, bottom: 12.0),
              child: TextField(
                controller: context.watch<ForageProvider>().getNotes,
                decoration: InputDecoration(
                    labelText: "Notes",
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 15.0),
                    filled: true,
                    fillColor: Color.fromARGB(255, 230, 227, 227)),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  child: Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    context.read<ForageProvider>().save();
                    widget.refreshCallback();
                    Navigator.pop(context);
                  },
                  color: Color.fromARGB(255, 47, 25, 190),
                  minWidth: 20.0,
                ),
                MaterialButton(
                  child: Text(
                    "Delete",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    context.read<ForageProvider>().clear();
                  },
                  color: Color.fromARGB(255, 47, 25, 190),
                  minWidth: 20.0,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
