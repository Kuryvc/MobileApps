import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Color> iconColors = [
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
  ]; // Initial colors for each icon

  void changeColor(int index) {
    setState(() {
      // Change the color when the button is clicked
      iconColors[index] =
          iconColors[index] == Colors.indigo ? Colors.black : Colors.indigo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'activity1',
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Mc Flutter',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          margin: const EdgeInsets.all(16.0),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: ListView(
            shrinkWrap: true,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.account_circle,
                    size: 65.0,
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Flutter McFlutter",
                          style: TextStyle(fontSize: 25.0),
                        ),
                        Text("Experienced App Developer")
                      ])
                ],
              ),
              const SizedBox(
                height: 12.0,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "123 Main Street",
                  ),
                  Text("(415) 555-0198")
                ],
              ),
              const SizedBox(
                height: 22.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Builder(builder: (BuildContext builderContext) {
                    return IconButton(
                        onPressed: () => {
                              ScaffoldMessenger.of(builderContext).showSnackBar(
                                  SnackBar(content: Text("Man Button"))),
                              changeColor(0)
                            },
                        icon: Icon(
                          Icons.man_sharp,
                          color: iconColors[0],
                        ));
                  }),
                  Builder(builder: (BuildContext builderContext) {
                    return IconButton(
                        onPressed: () => {
                              ScaffoldMessenger.of(builderContext).showSnackBar(
                                  SnackBar(content: Text("Timer Button"))),
                              changeColor(1)
                            },
                        icon: Icon(
                          Icons.timer,
                          color: iconColors[1],
                        ));
                  }),
                  Builder(builder: (BuildContext builderContext) {
                    return IconButton(
                        onPressed: () => {
                              ScaffoldMessenger.of(builderContext).showSnackBar(
                                  SnackBar(content: Text("Android Button"))),
                              changeColor(2)
                            },
                        icon: Icon(
                          Icons.phone_android,
                          color: iconColors[2],
                        ));
                  }),
                  Builder(builder: (BuildContext builderContext) {
                    return IconButton(
                        onPressed: () => {
                              ScaffoldMessenger.of(builderContext).showSnackBar(
                                  SnackBar(content: Text("iPhone Button"))),
                              changeColor(3)
                            },
                        icon: Icon(
                          Icons.phone_iphone,
                          color: iconColors[3],
                        ));
                  }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
