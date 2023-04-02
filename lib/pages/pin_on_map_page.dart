// pin a point on map

import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class PinOnMapPage extends StatefulWidget {
  const PinOnMapPage({super.key});

  @override
  State createState() => PinOnMapPageState();
}

class PinOnMapPageState extends State<PinOnMapPage> {
  MapboxMapController? mapController;
  static const initialLatLng = LatLng(37.755779, -122.415630);

  onMapCreated(MapboxMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: createMap(),
      floatingActionButton: buildFAB(),
    );
  }

  Column buildFAB() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Zoom in
        FloatingActionButton(
          heroTag: '1',
          onPressed: () {
            mapController?.animateCamera(CameraUpdate.zoomIn());
          },
          child: const Icon(Icons.add),
        ),
        const SizedBox(height: 5),
        // Zoom  out
        FloatingActionButton(
          heroTag: '2',
          onPressed: () {
            mapController?.animateCamera(CameraUpdate.zoomOut());
          },
          child: const Icon(Icons.remove),
        ),
      ],
    );
  }

  MapboxMap createMap() {
    return MapboxMap(
      accessToken:
          "sk.eyJ1IjoibXVoYW1tYWRiaWxhbDIwNzMiLCJhIjoiY2xmeXNiMjhhMDJzOTNnczd0a2U3a2dtMSJ9.l29smmvimCXGxwGqxCJiUQ",
      styleString: MapboxStyles.LIGHT,
      onMapCreated: onMapCreated,
      initialCameraPosition: const CameraPosition(
        target: initialLatLng,
        zoom: 14,
      ),
      // Pin on map
      onMapLongClick: (_, latlang) {
        mapController!.addSymbol(
          SymbolOptions(
            geometry: latlang,
            textField: 'Selected place',
            iconImage: 'attraction-15',
            textOffset: const Offset(0, 2),
          ),
        );
      },
    );
  }
}
