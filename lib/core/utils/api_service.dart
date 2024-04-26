/*
 *
 * ----------------
 * | 241030072002 |
 * ----------------
 * Copyright © [2024] KERO CS FLUTTER DEVELOPMENT.
 * All Rights Reserved. For inquiries or permissions, contact  me ,
 * https://www.linkedin.com/in/kerolos-fady-software-engineer/
 *
 * /
 */

import 'dart:io';

import 'package:http/http.dart' as http;
//All rights -- Kerolos Fady --Flutter Developer
import 'package:dio/dio.dart';
import 'dart:convert';

class ApiService {
  final _baseUrl = 'https://ihoneyherb.com/test-application/';
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({
    required String endPoint,
  }) async {
    _dio.options = BaseOptions(
      baseUrl: _baseUrl,
    );
    var response = await _dio.get('$_baseUrl$endPoint');
    return response.data;
  }

// 'email': 'aboelazm111@gmail.com',
//       'password': '123456',
//       'token': 'asd342dsdddsd323dsdadasd3e',
//       'device_id': 'bfghtr5yrtytd654e6trd',
//       'platform': '1'
  Future<Map<String, dynamic>> postData(
      String end, Map<String, dynamic> data) async {
    _dio.options =
        BaseOptions(baseUrl: _baseUrl, headers: {'Accept-Language': 'ar'});

    // var json = jsonEncode({
    //   "auth_key": "xx508xx63817x7525x74g004x30706542858349x5x78f5xx34xnh468",
    //   'user_id': '9'
    // });
    final formData = FormData.fromMap(data);
    final response = await _dio.post('$_baseUrl$end', data: formData);

    return response.data;
  }
}

// void main(List<String> args) async {
//   ApiService apiService = ApiService(Dio());
//   Dio dio = Dio();

//   var res = await apiService.postData('home/home.php', {
//     'auth_key': 'xx508xx63817x7525x74g004x30706542858349x5x78f5xx34xnh468',
//     'user_id': '16',
//   });

//   print(res);
// }
