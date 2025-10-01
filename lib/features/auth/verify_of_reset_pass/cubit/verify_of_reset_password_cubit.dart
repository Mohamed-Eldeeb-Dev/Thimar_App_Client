import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:thimar_app/core/services/server_gate.dart';

part 'verify_of_reset_password_state.dart';

class VerifyOfResetPasswordCubit extends Cubit<VerifyOfResetPasswordState> {
  VerifyOfResetPasswordCubit() : super(VerifyOfResetPasswordInitial());

  void verify({required String code, required String phone}) async {
    emit(VerifyOfResetPasswordLoading());
    final response = await ServerGate.i.sendToServer(
      url: 'verify',
      body: {
        'phone': phone,
        'code': code,
        'type': Platform.operatingSystem,
        'device_token': "test",
      },
    );
    if (response.success) {
      emit(VerifyOfResetPasswordSuccess());
    } else {
      emit(VerifyOfResetPasswordFailure(response.msg));
    }
  }

  void resendCode({required String phone}) async {
    emit(VerifyOfResetPasswordLoading());
    final response = await ServerGate.i.sendToServer(
      url: 'resend_code',
      body: {'phone': phone},
    );
    if (response.success) {
      emit(VerifyOfResetPasswordSuccess());
    } else {
      emit(VerifyOfResetPasswordFailure(response.msg));
    }
  }
}
