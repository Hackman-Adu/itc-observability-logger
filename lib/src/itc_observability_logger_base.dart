import 'package:http/http.dart' as client;
import 'package:itc_observability_logger/models/observability_device_model.dart';
import 'package:itc_observability_logger/models/observability_model.dart';
import 'package:itc_observability_logger/models/observability_response.dart';

abstract class ObservabilityLogger {
  Map<String, String> get requestHeader;

  String get requestUrl;

  String get logGroup;

  ObservabilityModel _observabilityModel(String message) =>
      ObservabilityModel(message, logGroup);

  bool deviceModelInitialized = DeviceModel.instance.deviceModel != null;

  Future<ObservabilityResponse?> observe(String message) async {
    try {
      if (!deviceModelInitialized) {
        return ObservabilityResponse(
            status: ResponseStatus.fail,
            responseBody: "Device model not initialised");
      }
      print(_observabilityModel(message).toString());
      var response = await client.post(Uri.parse(requestUrl),
          body: _observabilityModel(message).toJson(), headers: requestHeader);
      if (response.statusCode == 200) {
        return ObservabilityResponse(
            status: ResponseStatus.succes, responseBody: response.body);
      }
      return ObservabilityResponse(
          status: ResponseStatus.fail, responseBody: response.body);
    } catch (e) {
      return ObservabilityResponse(
          status: ResponseStatus.fail, responseBody: e.toString());
    }
  }
}
