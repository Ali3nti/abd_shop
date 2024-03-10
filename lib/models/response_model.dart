import 'package:flutter/foundation.dart';

class DataResponse {
  int status = 0;
  String message = '';
  dynamic data;

  DataResponse();

  DataResponse.fromJson(Map<String, dynamic> json) {
    try {
      status = json['status'] ?? 0;
      message = json['message'] ?? 'null';
      data = (json['data'] != null) ? json['data'] : null;
    } catch (e) {
      if (kDebugMode) {
        print("Exception - response_model.dart - DataResponse.fromJson(): $e");
      }
    }
  }
}
