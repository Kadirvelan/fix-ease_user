import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter/material.dart';

class RegisterDetails extends StatefulWidget {
  const RegisterDetails({Key? key}) : super(key: key);

  @override
  _RegisterDetailsState createState() => _RegisterDetailsState();
}

class _RegisterDetailsState extends State<RegisterDetails> {
  static const _initialCameraPosition =
      CameraPosition(target: LatLng(13.010651, 80.2331943), zoom: 17);

  late GoogleMapController _googleMapController;
  late Position? initPos = getPosition();
  late Marker _userLocation = Marker(
    markerId: MarkerId("User's Home"),
    infoWindow: InfoWindow(title: 'Home'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    position: LatLng(13.010651, 80.2331943),
  );

  Future<Position> getUserLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  getAddress(Position value) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
      value.latitude,
      value.longitude,
    );
    print(placemarks[0]);
  }

  getPosition() {
    getUserLocation().then((value) {
      print('Map Co-ordinates');
      print(value);
      setState(() {
        initPos = value;
      });
      initPos = value;
      print('init Position');
      print(initPos);
      getAddress(value);
    });
  }

  @override
  void initState() {
    super.initState();
    getPosition();
  }

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void _addMarker(LatLng pos) async {
      setState(() {
        _userLocation = Marker(
          markerId: MarkerId("User's Home"),
          infoWindow: InfoWindow(title: 'Home'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          position: pos,
        );
      });
    }

    if (initPos == Null) {
      return const Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.white,
            value: 5,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Choose location'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: _initialCameraPosition,
            zoomControlsEnabled: false,
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            onMapCreated: (controller) => _googleMapController = controller,
            markers: {
              _userLocation,
            },
            onLongPress: (argument) {
              print('long pressed');
              print(argument);
              _addMarker(argument);
            },
          ),
          Container(
            color: Colors.white,
            child: Text(
              'Hi this is suma',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
