import 'dart:convert';

import 'package:api_test_alam/service/auth_utility.dart';
import 'package:api_test_alam/service/network_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class NetworkCaller {
  Future<NetworkResponse> getRequest(String url) async {
    try {
      Response response = await get(Uri.parse(url),
          
          //headers: {'token': AuthUtility.userInfo.payload!.token.toString()}
          );
      if (response.statusCode == 200) {
        return NetworkResponse(
            true, response.statusCode, jsonDecode(response.body));
      } else {
        return NetworkResponse(false, response.statusCode, null);
      }
    } catch (e) {
      print(e.toString());
    }
    return NetworkResponse(false, -1, null);
  }

  // Post()
  Future<NetworkResponse> postRequest(
      String url, Map<String, dynamic> body) async {
    try {
      Response response = await post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
            //'token': AuthUtility.userInfo.token.toString()
          },
          body: jsonEncode(body));
      print(response.statusCode);
      print(response.body.toString());

      if (response.statusCode == 200) {
        return NetworkResponse(
            true, response.statusCode, jsonDecode(response.body));
      } else if (response.statusCode == 401) {
        
      } else {
        return NetworkResponse(false, response.statusCode, null);
      }
    } catch (e) {
      print(e.toString());
    }
    return NetworkResponse(false, -1, null);
  }

 

  // Future<void> gotoLogin() async {
  //   await AuthUtility.clearUserInfo();

  //   Navigator.pushAndRemoveUntil(
  //       TaskManagerApp.globalKey.currentContext!,
  //       MaterialPageRoute(builder: (context) => LoginScreen()),
  //       (route) => false);
  // }
}