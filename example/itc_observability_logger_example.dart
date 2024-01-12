import 'package:itc_observability_logger/itc_observability_logger.dart';

void main() async {
  AppObservabilityLogger logger = AppObservabilityLogger();
  await logger.observe("YOUR_OBSERVABILITY_MESSAGE");
}

class AppObservabilityLogger extends ObservabilityLogger {
  @override
  String get logGroup => "YOUR_OBSERVABILITY_LOG_GROUP";

  @override
  Map<String, String> get requestHeader => {};

  @override
  String get requestUrl => "YOUR_REQUEST_URL";
}
