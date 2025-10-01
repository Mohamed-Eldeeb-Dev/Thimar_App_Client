import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:thimar_app/core/services/server_gate.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());

  void sendResetCode({required String phone}) async {
    emit(ForgetPasswordLoading());
    final response = await ServerGate.i.sendToServer(
      url: "forget_password",
      body: {"phone": phone},
    );
    if (response.success) {
      emit(ForgetPasswordSuccess());
    } else {
      emit(ForgetPasswordFailure(response.msg));
    }
  }
}
