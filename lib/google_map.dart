import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

import 'camera.dart';


class google_map extends StatefulWidget {
  const google_map({Key? key}) : super(key: key);

  @override
  State<google_map> createState() => _google_mapState();
}

class _google_mapState extends State<google_map> {
  File? image;
  late GoogleMapController googleMapController;

  static const CameraPosition initialcameraaPosition =
      CameraPosition(target: LatLng(17.361431, 78.474533), zoom: 14);

  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          SizedBox(
            height: 30,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                InkWell(onTap: () async {
            await availableCameras().then(
              (value) => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CameraPage(cameras: value,),
                ),
              ),
            );
          },
                  child: Container(
                    child: const Center(
                        child: Text(
                      "IN",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
                    width: 180,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      border: Border.all(
                        color: Colors.white30,
                        width: 8,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                InkWell(
                  child: Container(
                    child: const Center(
                        child: Text(
                      "OUT",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
                    width: 180,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      border: Border.all(
                        color: Colors.white30,
                        width: 8,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: 450,
            height: 700,
            child: GoogleMap(
              initialCameraPosition: initialcameraaPosition,
              markers: markers,
              zoomControlsEnabled: false,
              mapType: MapType.normal,
              onMapCreated: (GoogleMapController controller) {
                googleMapController = controller;
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          Position position = await _determinePosition();

          googleMapController.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(
                  target: LatLng(position.latitude, position.longitude),
                  zoom: 14)));

          markers.clear();

          markers.add(Marker(
              markerId: const MarkerId('currentLocation'),
              position: LatLng(position.latitude, position.longitude)));

          setState(() {});
        },
        label: const Text("Current Location"),
        icon: const Icon(Icons.location_history),
      ),
    );
  }

  pickimage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) {
        return;
      }
      final imagepath = File(image.path);
      setState(() {
        this.image = imagepath;
      });
    } on Exception catch (e) {
      print("...................$e.....................");
    }
  }
}

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();

  if (!serviceEnabled) {
    await Geolocator.checkPermission();
  }

  permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      return Future.error("Location permission denied");
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error('Location permissions are permanently denied');
  }

  Position position = await Geolocator.getCurrentPosition();

  return position;
}
