import 'package:geocoding/geocoding.dart';
import 'package:weather_forecast/core/services/igeolocation_service.dart';

class FakeGeolocationService implements IGeolocationService {
  @override
  Future<Placemark?> getCurrentLocation() async {
    return const Placemark(
      name: 'Test Location',
      street: 'Rua de Teste, 123',
      locality: 'São Paulo',
      subLocality: 'Centro',
      administrativeArea: 'SP',
      subAdministrativeArea: 'São Paulo',
      postalCode: '01000-000',
      country: 'Brasil',
      isoCountryCode: 'BR',
    );
  }
}
