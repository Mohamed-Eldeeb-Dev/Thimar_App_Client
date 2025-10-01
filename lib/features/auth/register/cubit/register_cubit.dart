import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:thimar_app/core/services/server_gate.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  void register({
    required String name,
    required String phone,
    required String password,
    required String passwordConfirmation,
    required String city,
  }) async {
    emit(RegisterLoading());
    final response = await ServerGate.i.sendToServer(
      url: 'client_register',
      body: {
        'fullname': name,
        'phone': phone,
        'password': password,
        'password_confirmation': passwordConfirmation,
        'gender': "male",
        'lat': '0.0',
        "lng": '0.0',
      },
    );
    if (response.success) {
      emit(RegisterSuccess());
    } else if (!response.success) {
      emit(RegisterFailure(response.msg));
      return;
    }
  }
}
