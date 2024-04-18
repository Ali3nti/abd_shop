import 'dart:convert';

import 'package:abd_shop/constants.dart';
import 'package:abd_shop/models/response_model.dart';
import 'package:http/http.dart' as http;

Future<DataResponse> getMarkets() async {
  Uri url = Uri.parse("${baseUrl}api/getmarket.php");
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
        'Exception error: api_helper.dart - getMarkets(): Failed to load markets');
  }
}

Future<DataResponse> getProducts() async {
  Uri url = Uri.parse("${baseUrl}api/getproducts.php");
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
