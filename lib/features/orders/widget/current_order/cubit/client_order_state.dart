part of 'client_order_cubit.dart';

@immutable
sealed class ClientOrderState {}

final class ClientOrderInitial extends ClientOrderState {}

final class ClientOrderLoading extends ClientOrderState {}

final class ClientOrderSuccess extends ClientOrderState {
  final List<OrderModel> list;
  ClientOrderSuccess(this.list);
}

final class ClientOrderFailure extends ClientOrderState {
  final String error;
  ClientOrderFailure(this.error);
}
