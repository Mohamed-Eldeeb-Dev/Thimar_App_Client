import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:thimar_app/core/services/server_gate.dart';

part 'login_state.dart';
part 'login_model.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void login({required String phone, required String password}) async {
    emit(LoginLoading());
    final response = await ServerGate.i.sendToServer(
      url: 'login',
      body: {
        'phone': phone,
        'password': password,
        'device_token': "test",
        'type': Platform.operatingSystem,
        "user_type": 'client',
      },
    );
    if (response.success) {
      final loginModel = LoginModel.fromJson(response.data);
      emit(LoginSuccess(loginModel.data));
    } else {
      emit(LoginFailure(response.msg));
    }
  }
}
