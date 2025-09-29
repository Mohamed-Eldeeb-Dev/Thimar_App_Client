part of 'sliders_cubit.dart';

@immutable
sealed class SlidersState {}

final class SlidersInitial extends SlidersState {}

final class SlidersLoading extends SlidersState {}

final class SlidersSuccess extends SlidersState {
  final List<SliderModel> list;
  SlidersSuccess( this.list);
}
