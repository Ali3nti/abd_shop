import 'dart:convert';

import 'package:abd_shop/constants.dart';
import 'package:abd_shop/models/response_model.dart';
import 'package:http/http.dart' as http;

Future<DataResponse> getDataFromServer({
  required String apiName,
  String query = '',
}) async {
  // Uri url = Uri.parse("${baseUrl}api/getmarket.php");
  Uri url = Uri.parse("${baseUrl}api/$apiName.php${query}");
  Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  final response = await http.get(
    url,
    headers: headers,
  );
  if (response.statusCode == 200) {
    return DataResponse.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception(
        'Exception error: api_helper.dart - $apiName: Failed to load $apiName');
  }
}

Future<DataResponse> postData(int id) async {
  Uri url = Uri.parse("${baseUrl}api/getmarket.php");

  Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  Map<String, dynamic> body = {
    "id": id,
    "status": 1,
  };
  final response = await http.post(
    url,
    body: body,
    headers: headers,
  );
  if (response.statusCode == 200) {
    return DataResponse.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception(
        'Exception error: api_helper.dart - post: Failed to load postData');
  }
}

Future<DataResponse> getProducts(int id) async {
  Uri url = Uri.parse("${baseUrl}api/getproducts.php?id=$id");
  Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  final response = await http.get(
    url,
    headers: headers,
  );
  if (response.statusCode == 200) {
    return DataResponse.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception(
        'Exception error: api_helper.dart - getProducts(): Failed to load markets');
  }
}
