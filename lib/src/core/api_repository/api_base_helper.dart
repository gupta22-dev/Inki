import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:inki/src/core/api_repository/app_exception.dart';
import 'package:inki/src/core/constants/api_urls.dart';
import 'package:inki/src/core/constants/sharedpreference_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiBaseHelper {
  var header = {'Accept': 'application/json', 'Authorization': ''};
  var response;
  var _accessToken = "";
  SharedPreferences prefs;

  apiRequest(
      {String url,
      Map<String, dynamic> dynamicMapValue,
      Map<String, String> staticMapValue,
      int urlType,
      File fileName,
      BuildContext context}) async {
    // fetch data from server

    try {
      header['Authorization'] = 'Bearer $_accessToken';
      showLog('Api Request: Url:$baseUrl$url');

      if (urlType == 1) {
        response = await http.post('$baseUrl$url',
            body: dynamicMapValue, headers: header);
      } else if (urlType == 2) {
        final uri = Uri.https('$getRequest', '$url');
        response = await http.get(uri);
      } else if (urlType == 3) {
        response = await http.put('$baseUrl$url',
            body: dynamicMapValue, headers: header);
      } else if (urlType == 4) {
      } else {
        response = await http.post('$baseUrl$url',
            body: dynamicMapValue, headers: header);
      }

      showLog('Response status: ${response.statusCode}');
      showLog('Response body: ${response.body}');

      return _returnResponse(
          response: response,
          url: url,
          from: 1,
          context: context,
          map: dynamicMapValue,
          staticMap: staticMapValue);
    } on SocketException catch (e) {
      showLog('No network connection11--${e}');
      // showSnackbar(message: 'No network connection', context: context);
    } catch (e) {
      showLog('No network connection--${e}');
      if (e.toString().startsWith("SocketException")) {
        showLog('No network connection11--${e}');
      }
    }
  }

  dynamic _returnResponse(
      {http.Response response,
      String url,
      int from,
      BuildContext context,
      showProgress,
      Map<String, dynamic> map,
      Map<String, String> staticMap}) {
    switch (response.statusCode) {
      case 200:
        var responseJson = response.body;
        return responseJson != null ? responseJson : '';
      case 201:
        var responseJson = response.body;
        return responseJson != null ? responseJson : '';
      case 304:
        throw {showLog('no update available'), response.toString()};
      case 422:
        throw BadRequestException(response.toString());

      case 401:

      case 500:
        throw {};
      default:
        showLog('no update available  ${response.body}');
    }
  }

  removeAccessToken() async {
    await initPref();

    prefs.setString(SharedPreferenceKeys.accessToken, "");
  }

  initPref() async {
    if (prefs == null) prefs = await SharedPreferences.getInstance();
  }
}
