part of 'verify_of_reset_password_cubit.dart';

@immutable
sealed class VerifyOfResetPasswordState {}

final class VerifyOfResetPasswordInitial extends VerifyOfResetPasswordState {}
final class VerifyOfResetPasswordLoading extends VerifyOfResetPasswordState {}
final class VerifyOfResetPasswordSuccess extends VerifyOfResetPasswordState {}
final class VerifyOfResetPasswordFailure extends VerifyOfResetPasswordState {
  final String errorMessage;
  VerifyOfResetPasswordFailure(this.errorMessage);
}
