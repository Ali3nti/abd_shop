import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geocoding/geocoding.dart';

class AddressPage extends StatefulWidget {
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  LatLng? selectedLocation;
  String locationName = "موقعیت را انتخاب کنید";

  Future<void> _getLocationName(LatLng point) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(point.latitude, point.longitude);
      if (placemarks.isNotEmpty) {
        setState(() {
          locationName = placemarks[0].name ?? "نامشخص";
        });
      }
    } catch (e) {
      print("خطا در دریافت نام مکان: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("انتخاب لوکیشن"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 300,
              child: FlutterMap(
                options: MapOptions(
                  initialCenter: LatLng(31.1611, 52.6488),
                  minZoom: 10.0,
                  onTap: (tapPosition, point) {
                    setState(() {
                      selectedLocation = point;
                      _getLocationName(point);
                    });
                  },
                ),
                children: [
                  TileLayer(
                    urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: ['a', 'b', 'c'],
                  ),
                  MarkerLayer(
                    markers: [
                      if (selectedLocation != null)
                        Marker(
                          point: selectedLocation!,
                          child: Icon(Icons.location_on, color: Colors.blue, size: 40),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              locationName,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
