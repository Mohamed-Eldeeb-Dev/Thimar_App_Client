part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}
final class ProductLoading extends ProductState {}
final class ProductSuccess extends ProductState {
  final List<Data> list;
  ProductSuccess(this.list);
}
final class ProductFailure extends ProductState {
  final String error;   
  ProductFailure(this.error);
}
