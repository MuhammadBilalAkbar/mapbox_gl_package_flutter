import 'package:flutter/material.dart';

import 'customized_map_page.dart';
import 'pin_on_map_page.dart';
import 'simple_map_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  static const widgetOptions = <Widget>[
    SimpleMapPage(),
    CustomizedMapPage(),
    PinOnMapPage(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Mapbox GL Package Flutter'),
        ),
        body: Center(
          child: widgetOptions.elementAt(selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 36.0,
          selectedFontSize: 18.0,
          unselectedFontSize: 14.0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'Simple Map',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map_outlined),
              label: 'Customized Map',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.pin_drop),
              label: 'Pin on Map',
            ),
          ],
          currentIndex: selectedIndex,
          onTap: onItemTapped,
        ),
      );
}
