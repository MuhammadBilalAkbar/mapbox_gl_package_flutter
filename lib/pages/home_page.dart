import 'package:flutter/material.dart';

import 'pin_on_map_page.dart';
import 'customized_map_page.dart';
import 'simple_map_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Mapbox GL Package Flutter'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SimpleMapPage(),
                    ),
                  ),
                  child: const Text('Simple Map Page'),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CustomizedMap(),
                    ),
                  ),
                  child: const Text('Customized Map Page'),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PinOnMapPage(),
                    ),
                  ),
                  child: const Text('Pin on Map Page'),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      );
}
