enum ResponseStatus { succes, fail }

class ObservabilityResponse {
  ResponseStatus? status;
  Object? responseBody;
  ObservabilityResponse({this.responseBody, this.status});
}
