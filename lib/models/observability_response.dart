enum ResponseStatus { succes, fail }

class ObservabilityResponse {
  ResponseStatus? status;
  Object? responseBody;
  ObservabilityResponse({this.responseBody, this.status});

  String get printIcon =>
      status == ResponseStatus.succes ? "✅✅✅✅✅✅✅✅✅✅" : "❌❌❌❌❌❌❌❌❌❌";

  @override
  String toString() =>
      "$printIcon Observability Response $printIcon\nStatus:${status?.name} Response Body:$responseBody";
}
