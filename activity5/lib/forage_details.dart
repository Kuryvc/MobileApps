import 'package:flutter/material.dart';

class ForageDetails extends StatelessWidget {
  final String name;
  final String location;
  final String notes;
  final String isInSeason;

  const ForageDetails(
      {super.key,
      required this.name,
      required this.location,
      required this.notes,
      required this.isInSeason});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Forage Details")),
      body: Container(
        padding: EdgeInsets.all(16.0),
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              this.name,
              style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 24.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.location_on,
                  size: 30.0,
                ),
                SizedBox(
                  width: 12.0,
                ),
                Text(
                  this.location,
                  style: TextStyle(fontSize: 21.0, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(
              height: 24.0,
            ),
            Divider(
              color: Colors.grey,
              thickness: 1, // Adjust the thickness of the line
              height: 12, // Adjust the space above and below the line
            ),
            SizedBox(
              height: 24.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.note_alt,
                  size: 30.0,
                ),
                SizedBox(
                  width: 12.0,
                ),
                Text(
                  this.notes,
                  style: TextStyle(fontSize: 21.0, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(
              height: 24.0,
            ),
            Divider(
              color: Colors.grey,
              thickness: 1, // Adjust the thickness of the line
              height: 12, // Adjust the space above and below the line
            ),
            SizedBox(
              height: 24.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.calendar_month,
                  size: 30.0,
                ),
                SizedBox(
                  width: 12.0,
                ),
                IsinSeason()
              ],
            ),
            SizedBox(
              height: 24.0,
            ),
          ],
        ),
      ),
    );
  }

  Text IsinSeason() {
    if (this.isInSeason == true) {
      return Text("Currently in Season",
          style: TextStyle(fontSize: 21.0, color: Colors.grey));
    } else {
      return Text("Not currently in Season",
          style: TextStyle(fontSize: 21.0, color: Colors.grey));
    }
  }
}
