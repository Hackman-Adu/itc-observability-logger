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

  /// Before calling [observe], ensure you've called [ObservabilityDeviceModel.instance.intialisedModel] in your application main.dart
  Future observe(String message) async {
    var response = await observeRequest(message);
    print(response.toString());
  }
}
