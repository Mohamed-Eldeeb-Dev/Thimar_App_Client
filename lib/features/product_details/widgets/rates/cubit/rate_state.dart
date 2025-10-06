part of 'rate_cubit.dart';

@immutable
sealed class RateState {}

final class RateInitial extends RateState {}

final class RateLoading extends RateState {}

final class RateSuccess extends RateState {
  final List<Data> list;
  RateSuccess(this.list);
}

final class RateFailure extends RateState {
  final String errorMessage;
  RateFailure(this.errorMessage);
}
