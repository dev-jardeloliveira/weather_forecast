import 'package:geocoding/geocoding.dart';

abstract class IGeolocationService {
  Future<Placemark?> getCurrentLocation();
}
