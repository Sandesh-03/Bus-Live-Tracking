import 'dart:async';
import 'dart:convert';

import 'package:bus_user/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';

import '../Album.dart';

class BusDetails extends StatefulWidget {
  const BusDetails({Key? key}) : super(key: key);

  @override
  State<BusDetails> createState() => _BusDetailsState();
}

class _BusDetailsState extends State<BusDetails> {
  LocationData? currentLocation;
  bool showScreen = false;
  late String latx;
  late String logx;
  Future<Album> fetchAlbum() async {
    final response = await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/distancematrix/json?origins=${currentLocation!.latitude!.toInt()}%2C${currentLocation!.latitude!.toInt()}&destinations=19.0760%2C72.8777&key=AIzaSyCf27kGgk8LEH0mVy9sXNjBVmmEqhuCRas'));
    print(response.body);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Album.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<void> getCurrentLocation() async {
    Location location = Location();
    await location.getLocation().then((location) => currentLocation = location);
  }

  static const LatLng sourceLocation = LatLng(18.5204, 73.8567);
  static const LatLng destination = LatLng(18.5089, 73.9259);
  List<LatLng> polylineCoordinates = [];
  Future<void> getPolylinePoints() async {
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        google_api_key,
        PointLatLng(currentLocation!.latitude!, currentLocation!.longitude!),
        PointLatLng(destination.latitude, destination.longitude));

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) =>
          polylineCoordinates.add(LatLng(point.latitude, point.longitude)));
      setState(() {});
    }
  }

  late Album futureAlbum;
  late Future<Album> futureAlbum2;
  Future<void> getCredentials() async {
    await getCurrentLocation();
    setState(() {
      futureAlbum2 = fetchAlbum();
    });
    Album theAlbum = await futureAlbum2;
    setState(() {
      getPolylinePoints();
    });
  }

  @override
  void initState() {
    getCredentials();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xffF35c5b),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5))),
            title: const Text(
              "Bus Details",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: TabBar(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 4,
                labelStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                splashBorderRadius: BorderRadius.circular(5),
                tabs: const [
                  Tab(
                    icon: Icon(Icons.description),
                    text: 'Location',
                  ),
                  Tab(
                    icon: Icon(
                      Icons.details,
                    ),
                    text: 'Details',
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                child: Center(
                  child: (currentLocation == null)
                      ? const CircularProgressIndicator()
                      : GoogleMap(
                          tiltGesturesEnabled: true,
                          myLocationButtonEnabled: true,
                          mapToolbarEnabled: true,
                          myLocationEnabled: true,
                          trafficEnabled: true,
                          initialCameraPosition: CameraPosition(
                            target: LatLng(
                              currentLocation!.latitude!,
                              currentLocation!.longitude!,
                            ),
                            zoom: 14,
                          ),
                          polylines: {
                            Polyline(
                                polylineId: const PolylineId("route"),
                                points: polylineCoordinates,
                                color: Colors.red,
                                width: 8),
                          },
                          markers: {
                            Marker(
                                markerId: const MarkerId("currentlocation"),
                                position: LatLng(
                                  currentLocation!.latitude!,
                                  currentLocation!.longitude!,
                                )),
                            const Marker(
                                markerId: MarkerId("source"),
                                position: destination),
                            const Marker(
                                markerId: MarkerId("destination"),
                                position: destination)
                          },
                        ),
                ),
              ),

              // detais page
              Container(
                child: const Center(
                  child: Text('Estimated time'
                      ''),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
