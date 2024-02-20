import 'package:crypto_look/details_page.dart';
import 'package:flutter/material.dart';

class CryptoList extends StatelessWidget {
  const CryptoList({
    super.key,
    required this.datos,
  });

  final List datos;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: datos.length,
      itemBuilder: (BuildContext context, int index) {
        if (datos[index]["image"] != " " || datos[index]["image"] != null) {
          return ListTile(
            title: Text("${datos[index]["name"]}"),
            subtitle: "${datos[index]["year_established"]}" != "null"
                ? Text(
                    "${datos[index]["country"]}\n${datos[index]["year_established"]}")
                : Text("No date"),
            trailing:
                CircleAvatar(child: Text("${datos[index]["trust_score"]}")),
            leading: Image.network(datos[index]["image"]),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailsPage(
                        name: "${datos[index]["name"]}",
                        year: "${datos[index]["year_established"]}" != "null"
                            ? "${datos[index]["year_established"]}"
                            : "No date",
                        image: "${datos[index]["image"]}",
                        description: "${datos[index]["description"]}" != ""
                            ? "${datos[index]["description"]}"
                            : "No description",
                      )));
            },
          );
        }
        return null;
      },
    );
  }
}
