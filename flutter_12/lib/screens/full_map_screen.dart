import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

import 'package:http/http.dart' as http;

class FullMapScreen extends StatefulWidget {
  const FullMapScreen({Key? key}) : super(key: key);

  @override
  State<FullMapScreen> createState() => _FullMapScreenState();
}

class _FullMapScreenState extends State<FullMapScreen> {
  MapboxMapController? mapController;
  final center = const LatLng(10.472467, -84.966887);
  final String oscuro = 'mapbox://styles/lcmurillor/ckzi5hkhd000414n2sb7n5pab';
  final String claro = 'mapbox://styles/lcmurillor/ckzi7d3m1000015mrjwjthq6s';
  String selectedStyle = 'mapbox://styles/lcmurillor/ckzi5hkhd000414n2sb7n5pab';
  static const String ACCESS_TOKEN =
      'sk.eyJ1IjoibGNtdXJpbGxvciIsImEiOiJja3ppMnlpMmg0N29xMnVwaDBlMjhoMjUyIn0.AcVPO_N4lkn70nhqdETQ9w';

  var isLight = false;

  _onMapCreated(MapboxMapController controller) {
    mapController = controller;
    _onStyleLoaded();
  }

  void _onStyleLoaded() {
    addImageFromAsset("assetImage", "assets/custom-icon.png");
    addImageFromUrl("networkImage", "https://via.placeholder.com/50");
  }

  /// Adds an asset image to the currently displayed style
  Future<void> addImageFromAsset(String name, String assetName) async {
    final ByteData bytes = await rootBundle.load(assetName);
    final Uint8List list = bytes.buffer.asUint8List();
    return mapController?.addImage(name, list);
  }

  /// Adds a network image to the currently displayed style
  Future<void> addImageFromUrl(String name, String url) async {
    var response = await http.get(Uri.parse(url));
    return mapController?.addImage(name, response.bodyBytes);
  }

  _onStyleLoadedCallback() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text("Style loaded :)"),
      backgroundColor: Theme.of(context).primaryColor,
      duration: const Duration(seconds: 1),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _createMap(),
      floatingActionButton: _botonesFlotantes(),
    );
  }

  Column _botonesFlotantes() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () {
            mapController!.addSymbol(SymbolOptions(
                geometry: center,
                textField: 'esto es Tilaran',
                //iconSize: 3,
                iconImage: 'assetImage',
                textOffset: const Offset(0, 1)));
          },
          child: const Icon(Icons.margin),
        ),
        const SizedBox(
          height: 5,
        ),
        FloatingActionButton(
          onPressed: () {
            mapController!.animateCamera(CameraUpdate.zoomIn());
          },
          child: const Icon(Icons.zoom_in),
        ),
        const SizedBox(
          height: 5,
        ),
        FloatingActionButton(
          onPressed: () {
            mapController!.animateCamera(CameraUpdate.zoomOut());
          },
          child: const Icon(Icons.zoom_out),
        ),
        const SizedBox(
          height: 5,
        ),
        FloatingActionButton(
          onPressed: () {
            if (selectedStyle == oscuro) {
              selectedStyle = claro;
            } else {
              selectedStyle = oscuro;
            }
            setState(() {});
          },
          child: const Icon(Icons.add_to_home_screen),
        ),
      ],
    );
  }

  MapboxMap _createMap() {
    return MapboxMap(
      styleString: selectedStyle,
      //styleString: isLight ? MapboxStyles.LIGHT : MapboxStyles.DARK,
      accessToken: ACCESS_TOKEN,
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(target: center, zoom: 14),
      //onStyleLoadedCallback: _onStyleLoadedCallback,
    );
  }
}
