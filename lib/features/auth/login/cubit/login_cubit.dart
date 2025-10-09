import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:thimar_app/core/services/server_gate.dart';
import 'package:thimar_app/models/user_model.dart';

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
        'device_token': "test",
        'type': Platform.operatingSystem,
        "user_type": 'client',
      },
    );
    if (response.success) {
      // response.data['data']['token'] = UserModel.i.token;
      UserModel.i.fromJson(response.data['data']);
      // UserModel.i.fullname = response.data['data']['fullname'] ?? "";
      UserModel.i.save();
      emit(LoginSuccess());
    } else {
      emit(LoginFailure(response.msg));
    }
  }
}
