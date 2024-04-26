part of 'more_cubit.dart';

@immutable
sealed class MoreState {}

final class MoreInitial extends MoreState {}

final class GetMoreDataSuccesfully extends MoreState {
  final MoreProductsModel model;

  GetMoreDataSuccesfully({required this.model});
}

final class GetMoreDataError extends MoreState {
  final String error;

  GetMoreDataError({required this.error});
}

final class GetMoreDataLoading extends MoreState {}
