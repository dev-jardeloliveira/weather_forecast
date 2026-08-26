import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_forecast/core/services/igeolocation_service.dart';

class GeolocationService implements IGeolocationService {
  final Geocoding geocoding = Geocoding();
  final GeolocatorPlatform geolocator = GeolocatorPlatform.instance;

  @override
  Future<Placemark?> getCurrentLocation() async {
    if (!await geolocator.isLocationServiceEnabled()) {
      throw Exception('Location services are disabled.');
    }
    if (await geolocator.checkPermission() == LocationPermission.denied) {
      throw Exception('Location permissions are denied.');
    }
    final position = await geolocator.getCurrentPosition();
    final placemarks = await geocoding.placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );
    return placemarks.first;
  }
}
