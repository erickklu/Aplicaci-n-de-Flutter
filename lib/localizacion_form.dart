import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class UbicacionActualPage extends StatefulWidget {
  @override
  _UbicacionActualPageState createState() => _UbicacionActualPageState();
}

class _UbicacionActualPageState extends State<UbicacionActualPage> {
  final _formkey = GlobalKey<FormState>();
  Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _cameraPosition = CameraPosition(
    target: LatLng(-0.258889, -79.203565),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Ubicación Actual",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 7, 116, 67),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: Stack(
        key: _formkey,
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _cameraPosition,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          Positioned(
              top: 50.0,
              left: 10.0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(100),
                ),
              ))
        ],
      ),
    );
  }
}
