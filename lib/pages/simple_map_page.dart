import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

// FIXME: You need to pass in your access token via the command line argument
// It is also possible to pass it in while running the app via an IDE by passing the same args there.
// accessToken: const String.fromEnvironment("ACCESS_TOKEN"),
// flutter run --dart-define ACCESS_TOKEN=YOUR_TOKEN_HERE
// Alternatively you can replace `String.fromEnvironment("ACCESS_TOKEN")` in the following line with your access token directly.
// static const String ACCESS_TOKEN = String.fromEnvironment(
//     "sk.eyJ1IjoibXVoYW1tYWRiaWxhbDIwNzMiLCJhIjoiY2xmeXF0MjI0MHVhODNocXk0YTdjdThvMSJ9.HmgMcrFns1eU3cvK49NXsg");

class SimpleMapPage extends StatefulWidget {
  const SimpleMapPage({super.key});

  @override
  State createState() => SimpleMapPageState();
}

class SimpleMapPageState extends State<SimpleMapPage> {
  MapboxMapController? mapController;
  bool isLight = true;

  onMapCreated(MapboxMapController controller) => mapController = controller;

  final accessToken =
      "sk.eyJ1IjoibXVoYW1tYWRiaWxhbDIwNzMiLCJhIjoiY2xmeXNiMjhhMDJzOTNnczd0a2U3a2dtMSJ9.l29smmvimCXGxwGqxCJiUQ";

  onStyleLoadedCallback() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Style loaded :)"),
        backgroundColor: Theme.of(context).primaryColor,
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: MapboxMap(
          styleString: isLight ? MapboxStyles.LIGHT : MapboxStyles.DARK,
          accessToken: accessToken,
          onMapCreated: onMapCreated,
          initialCameraPosition: const CameraPosition(
            target: LatLng(37.755779, -122.415630),
            zoom: 14,
          ),
          onStyleLoadedCallback: onStyleLoadedCallback,
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(32.0),
          child: FloatingActionButton(
            child: const Icon(Icons.swap_horiz),
            onPressed: () => setState(() => isLight = !isLight),
          ),
        ),
      );
}
