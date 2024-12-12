import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geocoding/geocoding.dart';
import 'dart:math';

class Driver {
  final String name;
  final LatLng location;

  Driver(this.name, this.location);
}

class AddressPage extends StatefulWidget {
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  LatLng? selectedLocation;
  String locationName = "موقعیت را انتخاب کنید";
  Driver? nearestDriver;

  List<Driver> drivers = [
    Driver("راننده ۱", LatLng(31.1601, 52.6480)),
    Driver("راننده ۲", LatLng(31.1620, 52.6500)),
    Driver("راننده ۳", LatLng(31.1590, 52.6400)),
  ];

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

  void _findNearestDriver() {
    if (selectedLocation == null) return;

    double minDistance = double.infinity;
    Driver? closestDriver;

    for (var driver in drivers) {
      double distance = _calculateDistance(selectedLocation!, driver.location);
      if (distance < minDistance) {
        minDistance = distance;
        closestDriver = driver;
      }
    }

    setState(() {
      nearestDriver = closestDriver;
    });
  }

  double _calculateDistance(LatLng point1, LatLng point2) {
    const double earthRadius = 6371;
    double dLat = _degreesToRadians(point2.latitude - point1.latitude);
    double dLon = _degreesToRadians(point2.longitude - point1.longitude);
    double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_degreesToRadians(point1.latitude)) * cos(_degreesToRadians(point2.latitude)) *
            sin(dLon / 2) * sin(dLon / 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return earthRadius * c;
  }

  double _degreesToRadians(double degrees) {
    return degrees * (pi / 180);
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
                      _findNearestDriver();
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
          if (nearestDriver != null)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "نزدیک‌ترین راننده: ${nearestDriver!.name}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
        ],
      ),
    );
  }
}
