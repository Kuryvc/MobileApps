import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String name;
  final String year;
  final String image;
  final String description;

  const DetailsPage(
      {super.key,
      required this.name,
      required this.year,
      required this.image,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                this.image,
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                this.name,
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              Text(
                this.year,
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                this.description,
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
