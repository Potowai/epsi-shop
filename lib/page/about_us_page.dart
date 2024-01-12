import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class AboutUsPage extends StatelessWidget {
  AboutUsPage({super.key});

  final mapController = MapController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        options: const MapOptions(
          initialCenter: LatLng(48.8534, 2.3488),
          initialZoom: 13.0,
        ),
        mapController: mapController,
        children: [
          TileLayer(
            urlTemplate:
                'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}',
          ),
          const MarkerLayer(markers: [
            Marker(
              point: LatLng(48.8534, 2.3488),
              child: Icon(Icons.location_on, color: Colors.red),
            ),
          ]),
        ],
      ),
    );
  }
}
