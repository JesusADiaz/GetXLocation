import 'dart:async';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var latitude =  "Gettin Latitude..".obs;
  var longitude = "Gettin Longitude..".obs;
  var address = "Gettin Address..".obs;
  late StreamSubscription<Position> streamSubscription;

  @override
  void onInit() async{
    super.onInit();
    getLocation();
  }


  @override
  void onReady () {
    super.onReady();
  }

  @override
  void onClose(){
    streamSubscription.cancel();
  }
  getLocation () async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      return Future.error('Location permissions are denied');
    }
    if (permission == LocationPermission.deniedForever){
      return Future.error('Location permissions are permanently denied');
    }
    streamSubscription = Geolocator.getPositionStream().listen((Position position) {
      latitude.value = "Latitude: ${position.latitude.toString()}";
      longitude.value = "Longitude: ${position.latitude.toString()}";
      getAddressFromLatLng(position);
    });
  }

  Future<void> getAddressFromLatLng(Position position)async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];
    address.value =
        "Adrress: ${place.street}, ${place.locality}, ${place.postalCode}, ${place.country}";
  }
}