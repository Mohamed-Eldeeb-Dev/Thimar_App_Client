import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:thimar_app/core/services/server_gate.dart';

part 'verify_state.dart';

class VerifyCubit extends Cubit<VerifyState> {
  VerifyCubit() : super(VerifyInitial());

  void verify({required String code, required String phone}) async {
    emit(VerifyLoading());
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
      emit(VerifySuccess());
    } else {
      emit(VerifyFailure(response.msg));
    }
  }

  void resendCode({required String phone}) async {
    emit(VerifyLoading());
    final response = await ServerGate.i.sendToServer(
      url: 'resend_code',
      body: {'phone': phone},
    );
    if (response.success) {
      emit(VerifySuccess());
    } else {
      emit(VerifyFailure(response.msg));
    }
  }
}
