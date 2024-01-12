import 'package:http/http.dart' as client;
import 'package:itc_observability_logger/models/observability_device_model.dart';
import 'package:itc_observability_logger/models/observability_model.dart';
import 'package:itc_observability_logger/models/observability_response.dart';

abstract class ITCObservabilityLogger {
  Map<String, String> get observabilityRequestHeader;

  String get observabilityRequestUrl;

  String get observabilityLogGroup;

  ObservabilityModel _observabilityModel(String message) =>
      ObservabilityModel(message, observabilityLogGroup);

  bool get deviceModelNotInitialized =>
      ObservabilityDeviceModel.instance.deviceModel == null;

  Future<ObservabilityResponse?> observeRequest(String message) async {
    try {
      if (deviceModelNotInitialized) {
        return ObservabilityResponse(
            status: ResponseStatus.fail,
            responseBody:
                "Initialise device model ---- Call [ObservabilityDeviceModel.instance.intialisedModel()]");
      }
      print(_observabilityModel(message).printRequest(observabilityRequestUrl));
      var response = await client.post(Uri.parse(observabilityRequestUrl),
          body: _observabilityModel(message).toJson(),
          headers: observabilityRequestHeader);
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
