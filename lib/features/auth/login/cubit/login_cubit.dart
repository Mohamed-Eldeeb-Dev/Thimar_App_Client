import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:thimar_app/core/services/server_gate.dart';
import 'package:thimar_app/features/auth/login/model/login_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void login({required String phone, required String password}) async {
    emit(LoginLoading());
    final response = await ServerGate.i.sendToServer(
      url: 'login',
      body: {
        'phone': phone,
        'password': password,
        'device_token': "test_token",
        'device_type': Platform.operatingSystem,
        "type": 'client',
      },
    );
    if (response.success) {
      final loginModel = LoginModel.fromJson(
        response.data as Map<String, dynamic>,
      );
      emit(LoginSuccess(loginModel.data!));
    } else {
      emit(LoginFailure('Login failed'));
    }
  }
}
