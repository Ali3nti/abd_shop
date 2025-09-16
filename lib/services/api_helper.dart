import 'dart:convert';

import 'package:abd_shop/constants.dart';
import 'package:abd_shop/models/product_model.dart';
import 'package:abd_shop/models/response_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

////////////////////////////////////////////////////////////////////////
////////////////////////////////Get Request/////////////////////////////
////////////////////////////////////////////////////////////////////////
Future<DataResponse> getAllCategories() async {
  return await getRequest(apiName: "all_categories");
}

Future<DataResponse> getProductsOfCategory(int categoryId) async {
  return await getRequest(apiName: "cat_products", query: "?id=$categoryId");
}

Future<DataResponse> getProducts() async {
  return await getRequest(apiName: "all_products");
}
////////////////////////////////////////////////////////////////////////
////////////////////////////////Post Request////////////////////////////
////////////////////////////////////////////////////////////////////////

Future<DataResponse> sendNewProduct({
  required Product product,
  required List<dynamic> images,
}) async {
  Map<String, dynamic> dataBody = {
    'name': product.name,
    'category_id': product.categoryId,
    'price': product.price,
    // 'image': product.image,
    'description': product.description,
    'stock_quantity': product.stockQuantity,
    'unit': product.unit,
    'brand': product.brand,
    'is_active': product.isActive,
    'weight': product.weight,
    'dimensions': product.dimensions,
    // 'color': product.color,
    'warranty': product.warranty,
    'discount': product.discount,
    "images": (!kIsWeb)
        ? images.map((e) => base64Encode(e.readAsBytesSync())).toList()
        : null
  };
  print(dataBody);
  return await postRequest(apiName: "add_products", dataBody: dataBody);
}

Future<DataResponse> login({
  required String phoneNumber,
}) async {
  Map<String, dynamic> dataBody = {
    'phone_number': phoneNumber,
  };
  print(dataBody);
  return await postRequest(apiName: "sign_in", dataBody: dataBody);
}



Future<DataResponse> postinfo({
  required String firstname,
  required String lastname,
}) async {
  Map<String, dynamic> dataBody = {
    'first_name': firstname,
    'last_name': lastname,
  };
  print(dataBody);
  return await postRequest(apiName: "sign_in", dataBody: dataBody);
}



Future<DataResponse> userprofile({
  required String phoneNumber,
  required String firstname,
}) async {
  Map<String, dynamic> dataBody = {
    'phone_number': phoneNumber,
    'first_name': firstname,
  };
  print(dataBody);
  return await postRequest(apiName: "sign_in", dataBody: dataBody);
}
////////////////////////////////////////////////////////////////////////
////////////////////////////////Base API////////////////////////////////
////////////////////////////////////////////////////////////////////////

/*
**get request for get data from http service
**for use this:
**create new method in this file and use getRequest method in it.
*/

Future<DataResponse> getRequest({
  required String apiName,
  String query = '',
}) async {
  Uri url = Uri.parse("${baseUrl}api/$apiName$query");
  print(url);

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
        'Exception error: api_helper.dart - $apiName: Failed to load get request from $apiName');
  }
}

///////////////////////////////////////////////
/////////////////////////////////////////////////
// Future<DataResponse> login2(
//     {required String phoneNumber}) async {
//   Uri uri = Uri.https('abd.alinematollahi.ir', "api/sign_in");
//   Map<String, String> headers = {
//     'Content-Type': 'application/json',
//   };
//   final msg = jsonEncode({
//     "phone_number": phoneNumber
//   });
//
//   final response = await http.post(
//     uri,
//     headers: headers,
//     encoding: Encoding.getByName('utf-8'),
//     body: msg,
//   );
//   if (response.statusCode == 200) {
//     print("**!!!** login response: ---->  ${response.body}");
//     if (kDebugMode) {
//       print("*** login received");
//     }
//     return DataResponse.fromJson(jsonDecode(response.body));
//   } else {
//     String errorCode = response.statusCode.toString();
//     throw Exception(
//         'Failed to connect -login-: $errorCode -> ${response.body}');
//   }
// }
// /////////////////////////////////////////
/////////////////////////////////////////////////


/*
**post request for get data from http service
**for use this:
**create new method in this file and use postRequest method in it.
*/
Future<DataResponse> postRequest({
  required String apiName,
  required Map<String, dynamic> dataBody,
}) async {
  Uri url = Uri.parse("${baseUrl}api/$apiName");

  Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  final response = await http.post(
    url,
    body: jsonEncode(dataBody),
    encoding: Encoding.getByName('utf-8'),
    headers: headers,
  );

  if (response.statusCode == 200) {
    return DataResponse.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    String errorCode = response.statusCode.toString();
    throw Exception(
        'Exception error: api_helper.dart - $apiName: Failed to load post request from : $errorCode -> ${response.body}');
  }
}

// Future<DataResponse> postData(int id) async {
//   Uri url = Uri.parse("${baseUrl}api/getmarket.php");
//
//   Map<String, String> headers = {
//     'Content-Type': 'application/json',
//   };
//   Map<String, dynamic> body = {
//     "id": id,
//     "status": 1,
//   };
//   final response = await http.post(
//     url,
//     body: body,
//     headers: headers,
//   );
//   if (response.statusCode == 200) {
//     return DataResponse.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception(
//         'Exception error: api_helper.dart - post: Failed to load postData');
//   }
// }

// Future<DataResponse> getProducts(int category) async {
//   Uri url = Uri.parse("${baseUrl}api/getproducts.php?id=$category");
//   Map<String, String> headers = {
//     'Content-Type': 'application/json',
//   };
//   final response = await http.get(
//     url,
//     headers: headers,
//   );
//   if (response.statusCode == 200) {
//     return DataResponse.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception(
//         'Exception error: api_helper.dart - getProducts(): Failed to load markets');
//   }
// }
// Future<List<Product>> getProducts(int category) async {
//   Uri url = Uri.parse("${baseUrl}api/cat_products?id=$category");
//   Map<String, String> headers = {
//     'Content-Type': 'application/json',
//   };
//
//   final response = await http.get(url, headers: headers);
//
//   if (response.statusCode == 200) {
//     List<dynamic> jsonList = jsonDecode(response.body);
//     return jsonList.map((json) => Product.fromJson(json)).toList();
//   } else {
//     throw Exception('Failed to load products');
//   }
// }
