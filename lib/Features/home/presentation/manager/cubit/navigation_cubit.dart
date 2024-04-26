import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:task_mind/Features/home/presentation/views/widgets/cart_body.dart';
import 'package:task_mind/Features/home/presentation/views/widgets/fav_body.dart';
import 'package:task_mind/Features/home/presentation/views/widgets/home_view_body.dart';
import 'package:task_mind/Features/home/presentation/views/widgets/profile_body.dart';
import 'package:task_mind/Features/home/presentation/views/widgets/screen2_view_body.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationInitial());
  int currIndex = 4;
  List<Widget> screens1 = [
    const HomeViewBody(),
    const Screen2Body(),
    const CartViewBody(),
    const FavouritesViewBody(),
    const ProfileViewBody(),
  ].reversed.toList();
  void changeIndex(int index) {
    currIndex = index;
    print(currIndex);
    emit(ChangeIndex());
  }
}
