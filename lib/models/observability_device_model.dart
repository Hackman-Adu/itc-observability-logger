import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

class ObservabilityDeviceModel {
  ObservabilityDeviceModel._();

  static final ObservabilityDeviceModel _instance =
      ObservabilityDeviceModel._();

  static ObservabilityDeviceModel get instance => _instance;

  String? deviceModel;

  Future<void> intialisedModel() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        deviceModel = androidInfo.model;
      } else if (Platform.isIOS) {
        final IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        deviceModel = iosInfo.utsname.machine;
      }
    } catch (e) {
      return;
    }
  }
}
