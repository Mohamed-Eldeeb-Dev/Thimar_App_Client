part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

// final class HomeLoading extends HomeState {}

// final class HomeSuccess extends HomeState {}

// final class HomeFailure extends HomeState {
  // final String error;
  // HomeFailure(this.error);
// }

// final class SlidersInitial extends HomeState {}

final class SlidersLoading extends HomeState {}

final class SlidersSuccess extends HomeState {}

final class SlidersFailure extends HomeState {
  final String error;
  SlidersFailure(this.error);
}

// final class CategoryInitial extends HomeState {}

final class CategoryLoading extends HomeState {}

final class CategorySuccess extends HomeState {}

final class CategoryFailure extends HomeState {
  final String error;
  CategoryFailure(this.error);
}

// final class ProductInitial extends HomeState {}

final class ProductLoading extends HomeState {}

final class ProductSuccess extends HomeState {}  
final class ProductFailure extends HomeState {
  final String error;
  ProductFailure({required this.error});
}

