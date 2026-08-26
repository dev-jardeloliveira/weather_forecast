import 'package:permission_handler/permission_handler.dart';

abstract class IPermissionService {
  Future<bool> checkPermission({Permission? permission});
  Future<void> requestPermission({Permission? permission});
}
