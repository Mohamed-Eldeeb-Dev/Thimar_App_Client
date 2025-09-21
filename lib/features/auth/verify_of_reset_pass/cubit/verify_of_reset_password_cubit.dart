import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'verify_of_reset_password_state.dart';

class VerifyOfResetPasswordCubit extends Cubit<VerifyOfResetPasswordState> {
  VerifyOfResetPasswordCubit() : super(VerifyOfResetPasswordInitial());
}
