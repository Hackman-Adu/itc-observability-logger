import 'package:itc_observability_logger/itc_observability_logger.dart';

void main() async {
  AppObservabilityLogger logger = AppObservabilityLogger();
  await logger.observeRequest("OBSERVABILITY_MESSAGE");
}

class AppObservabilityLogger extends ITCObservabilityLogger {
  @override
  Map<String, String> get observabilityRequestHeader => {};

  @override
  String get observabilityRequestUrl => "url";

  @override
  String get observabilityLogGroup => "log group";

  Future observe(String message) async {
    // Intialise device model first
    await ObservabilityDeviceModel.instance.intialisedModel();
    var response = await observeRequest(message);
    print(response.toString());
  }
}
