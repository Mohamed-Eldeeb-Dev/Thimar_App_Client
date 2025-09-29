import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:thimar_app/core/services/server_gate.dart';

part 'sliders_state.dart';
part 'sliders_model.dart';

class SlidersCubit extends Cubit<SlidersState> {
  SlidersCubit() : super(SlidersInitial());

  void getData() async {
    emit(SlidersLoading());
    final response = await ServerGate.i.getFromServer(url: "sliders");
    final slidersModel = SlidersModel.fromJson(response.data);
    if (response.success) {
      emit(SlidersSuccess(slidersModel.list));
    } else {
      emit(SlidersInitial());
    }
  }
}
