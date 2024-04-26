part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}


final class LoginSuccess extends HomeState {}

final class LoginError extends HomeState {
  final String error;

  LoginError({required this.error});
}

final class LoginLoading extends HomeState {}

final class GetDataSuccesfully extends HomeState {
  final HomeModel model;

  GetDataSuccesfully({required this.model});
}

final class GetDataError extends HomeState {
  final String error;

  GetDataError({required this.error});
}

final class GetDataLoading extends HomeState {}

