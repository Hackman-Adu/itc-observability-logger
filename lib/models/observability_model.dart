import 'dart:convert';

import 'package:intl/intl.dart';

class ObservabilityModel {
  String? loggroup;
  String? logstream;
  String? message;
  int? timestamp;

  String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  ObservabilityModel(String? observeMessage, String? logGroup) {
    loggroup = logGroup;
    logstream = formattedDate;
    message = observeMessage;
    timestamp = DateTime.now().millisecondsSinceEpoch;
  }

  String printRequest(String url) =>
      "✨✨✨✨✨✨✨✨✨✨ Observability Request ✨✨✨✨✨✨✨✨✨✨\nUrl: $url  Body:${toJson()}";

  String toJson() {
    var map = {
      "loggroup": loggroup,
      "logstream": logstream,
      "message": message,
      "timestamp": timestamp
    };
    return json.encode(map);
  }
}
