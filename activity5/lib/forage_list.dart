import 'package:activity5/forage_details.dart';
import 'package:activity5/forage_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForageList extends StatelessWidget {
  const ForageList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: context.read<ForageProvider>().getForageList.length,
        itemBuilder: (BuildContext context, int index) {
          List<Map<String, dynamic>> forageList =
              context.read<ForageProvider>().getForageList;
          return ListTile(
            title: Text("${forageList[index]["name"]}"),
            subtitle: Text("${forageList[index]["location"]}"),
            trailing: CircleAvatar(child: Icon(Icons.location_on)),
            hoverColor: Colors.blue,
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ForageDetails(
                      name: "${forageList[index]["name"]}",
                      location: "${forageList[index]["location"]}",
                      notes: "${forageList[index]["notes"]}",
                      isInSeason: "${forageList[index]["isInSeason"]}")));
            },
          );
        });
  }
}
