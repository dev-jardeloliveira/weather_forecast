import 'package:permission_handler/permission_handler.dart';
import 'package:weather_forecast/core/services/ipermission_service.dart';

class FakePermissionService implements IPermissionService {
  @override
  Future<bool> checkLocationPermission() async {
    return true;
  }

  @override
  Future<bool> checkPermission({Permission? permission}) async {
    switch (permission) {
      case Permission.location:
        final status = await Permission.location.status;
        return status.isGranted;
      case Permission.locationWhenInUse:
        final status = await Permission.locationWhenInUse.status;
        return status.isGranted;
      case Permission.locationAlways:
        final status = await Permission.locationAlways.status;
        return status.isGranted;
      default:
        return false;
    }
  }

  @override
  Future<void> requestPermission({Permission? permission}) async {
    switch (permission) {
      case Permission.location:
        await Permission.location.request();
        break;
      case Permission.locationWhenInUse:
        await Permission.locationWhenInUse.request();
        break;
      case Permission.locationAlways:
        await Permission.locationAlways.request();
        break;
      default:
        break;
    }
  }
}
