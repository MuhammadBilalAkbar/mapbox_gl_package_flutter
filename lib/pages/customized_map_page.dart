import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class CustomizedMapPage extends StatefulWidget {
  const CustomizedMapPage({super.key});

  @override
  State createState() => CustomizedMapPageState();
}

class CustomizedMapPageState extends State<CustomizedMapPage> {
  MapboxMapController? mapController;

  final accessToken =
      "sk.eyJ1IjoibXVoYW1tYWRiaWxhbDIwNzMiLCJhIjoiY2xmeXNiMjhhMDJzOTNnczd0a2U3a2dtMSJ9.l29smmvimCXGxwGqxCJiUQ";

  String currentStyle =
      'mapbox://styles/muhammadbilal2073/clfzfvkxv003401o8b036pipm';
  final monochromeStyle =
      'mapbox://styles/muhammadbilal2073/clfzfvkxv003401o8b036pipm';
  final outdoorStyle =
      'mapbox://styles/muhammadbilal2073/clfzf3f9w001b01qfmt3qbyq9';
  final streetStyle =
      'mapbox://styles/muhammadbilal2073/clfzfqgby001f01p7p1cxu42u';

  onMapCreated(MapboxMapController controller) => mapController = controller;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: MapboxMap(
          accessToken: accessToken,
          styleString: currentStyle,
          onMapCreated: onMapCreated,
          initialCameraPosition: const CameraPosition(
            target: LatLng(37.755779, -122.415630),
            zoom: 14,
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(32.0),
          // Change map styles
          child: FloatingActionButton(
            onPressed: () {
              setState(() {
                if (currentStyle != monochromeStyle) {
                  currentStyle = monochromeStyle;
                  return;
                }
                currentStyle = outdoorStyle;
              });
            },
            tooltip: 'Swap Monochrome and Street Style',
            child: const Icon(Icons.swap_horizontal_circle),
          ),
        ),
      );
}
