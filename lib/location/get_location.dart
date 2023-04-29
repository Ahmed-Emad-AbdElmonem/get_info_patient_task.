import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

abstract class GetUserLocation {
  static bool? servies;
  static late Position cl;
  static late List<Placemark> placemarks;

  static Future getUserPermissionAndLatAndLang() async {
    LocationPermission per;
    servies = await Geolocator.isLocationServiceEnabled();
    per = await Geolocator.checkPermission();

    if (per == LocationPermission.denied) {
      per = await Geolocator.requestPermission();
      if (per == LocationPermission.always) {
        getLatAndLang();
      }
    }
  }

// get lat and lang
  static Future<Position> getLatAndLang() async {
    return await Geolocator.getCurrentPosition().then((value) {
      cl = value;
      return value;
    });
  }

// get location
  static Future<List<Placemark>> getUserLocation() async {
    return await placemarkFromCoordinates(cl.altitude, cl.longitude);
  }

// get user country
  static late List<Placemark> location;
  static String? usercountry;

  static Future<String?> getUserCountry() async {
    location = await GetUserLocation.getUserLocation();
    usercountry = location[0].country;

    if (usercountry == null) {
      return 'country';
    } else {
      return usercountry;
    }
  }

// get All
  static Future getLocation() async {
    await GetUserLocation.getUserPermissionAndLatAndLang();
    await GetUserLocation.getLatAndLang();
    await GetUserLocation.getUserLocation();
    await GetUserLocation.getUserLocation();
    await GetUserLocation.getUserCountry();
  }
}
