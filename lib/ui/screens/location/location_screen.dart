import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

// ignore: must_be_immutable
class LocationScreen extends StatelessWidget {
  LocationScreen({super.key});


  List<Marker> markers = [
    const Marker(
      width: 80.0,
      height: 80.0,
      point: LatLng(-22.29701, -48.54576),
      child: Icon(Icons.location_on, color: Colors.red, size: 40.0),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        options: const MapOptions(
          initialCenter: LatLng(-22.29701, -48.54576), //* localização inicial
          initialZoom: 15,
        ),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", //* mapa
            subdomains: const ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: markers,
          ),
        ],
      ),
    );
  }
}
