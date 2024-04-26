// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_mind/Features/home/data/models/home_model.dart';
import 'package:task_mind/Features/home/data/models/more_model.dart';
import 'package:task_mind/Features/home/data/repos/product_repo.dart';
import 'package:task_mind/Features/home/presentation/views/widgets/cart_body.dart';
import 'package:task_mind/Features/home/presentation/views/widgets/fav_body.dart';
import 'package:task_mind/Features/home/presentation/views/widgets/home_view_body.dart';
import 'package:task_mind/Features/home/presentation/views/widgets/profile_body.dart';
import 'package:task_mind/Features/home/presentation/views/widgets/screen2_view_body.dart';
import 'package:task_mind/core/utils/api_service.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.api) : super(HomeInitial());
 
  final ApiService api;
  void login(String email, String pass) {
    emit(LoginLoading());
    api.postData('login.php', {
      'email': email,
      'token': 'asd342dsdddsd323dsdadasd3e',
      'password': pass,
      'device_id': 'bfghtr5yrtytd654e6trd',
      'platform': '1'
    }).then((value) {
      if (value['status'] == true) {
        emit(LoginSuccess());
      } else {
        emit(LoginError(error: value['msg']));
      }
    }).catchError((e) {
      emit(LoginError(error: e.toString()));
    });
  }

  HomeModel? model;
  HomeRepo repo = HomeRepo();

  void getHomeData() {
    emit(GetDataLoading());
    repo.getHomeData().then((value) {
      print("get home data");
      model = value;
      print(model?.msg);
      emit(GetDataSuccesfully(model: value));
    }).catchError((e) {
      print(e.toString());
      emit(GetDataError(error: e.toString()));
    });
  }

  // List<PersistentBottomNavBarItem> navBarsItems = [
  //   PersistentBottomNavBarItem(
  //     icon: const Icon(Icons.home),
  //     title: (""),
  //     activeColorPrimary: primaryColor,
  //     inactiveColorPrimary: Colors.grey,
  //   ),
  //   PersistentBottomNavBarItem(
  //     icon: const Icon(CupertinoIcons.square_favorites),
  //     title: (""),
  //     activeColorPrimary: primaryColor,
  //     inactiveColorPrimary: CupertinoColors.systemGrey,
  //   ),
  //   PersistentBottomNavBarItem(
  //     icon: const Icon(
  //       CupertinoIcons.cart,
  //       color: Colors.white,
  //     ),
  //     title: (""),
  //     activeColorPrimary: primaryColor,
  //     inactiveColorPrimary: CupertinoColors.systemGrey,
  //   ),
  //   PersistentBottomNavBarItem(
  //     icon: const Icon(CupertinoIcons.heart),
  //     title: (""),
  //     activeColorPrimary: primaryColor,
  //     inactiveColorPrimary: CupertinoColors.systemGrey,
  //   ),
  //   PersistentBottomNavBarItem(
  //     icon: const Icon(CupertinoIcons.person_alt_circle_fill),
  //     title: (""),
  //     activeColorPrimary: primaryColor,
  //     inactiveColorPrimary: CupertinoColors.systemGrey,
  //   ),
  // ];
}
