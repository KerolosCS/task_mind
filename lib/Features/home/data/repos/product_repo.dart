import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:task_mind/Features/home/data/models/home_model.dart';
import 'package:task_mind/Features/home/data/models/more_model.dart';
import 'package:task_mind/core/utils/api_service.dart';

class HomeRepo {
  ApiService api = ApiService(Dio());
  Future<HomeModel> getHomeData() async {
    var res = await api.postData('/home/home.php', {
      'auth_key': 'xx508xx63817x7525x74g004x30706542858349x5x78f5xx34xnh468',
      'user_id': '9'
    });
    if (kDebugMode) {
      print(res.length);
    }
    return HomeModel.fromJson(res);
  }

  Future<MoreProductsModel> getmoreProducts() async {
    var res = await api.postData('/products/search_filter.php', {
      'auth_key': 'xx508xx63817x7525x74g004x30706542858349x5x78f5xx34xnh3251',
      'user_id': '1',
      'search_with': 'home_types',
      'home_types': 'new',
      'item_count': '0',
      'limit': '30',
    });
    //[{"key":"item_count","value":"0","type":"text"}][{"key":"search_with","value":"home_types","description":"keyword,home_types","type":"text"}]
    if (kDebugMode) {
      print(res.length);
    }
    return MoreProductsModel.fromJson(res);
  }
}
