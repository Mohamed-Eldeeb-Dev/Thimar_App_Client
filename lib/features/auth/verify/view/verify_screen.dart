import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/local_widgets/background_container.dart';
import 'package:thimar_app/core/local_widgets/custom_elevated_button.dart';
import 'package:thimar_app/core/local_widgets/custom_logo.dart';
import 'package:thimar_app/core/routes/app_routes_fun.dart';
import 'package:thimar_app/core/utils/app_spaces.dart';
import 'package:thimar_app/core/utils/app_theme.dart';
import 'package:thimar_app/core/local_widgets/pin_code.dart';
import 'package:thimar_app/features/auth/verify/cubit/verify_cubit.dart';

import '../../../../core/routes/routes.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key, required this.phone});
  final String phone;
  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final TextEditingController controller = TextEditingController();
  final CountDownController _countDownController = CountDownController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isResendEnabled = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerifyCubit(),
      child: Form(
        key: _formKey,
        child: Scaffold(
          body: BlocConsumer<VerifyCubit, VerifyState>(
            listener: (context, state) {
              if (state is VerifySuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('تم التحقق بنجاح')),
                );
                AppRoutesFunc.pushAndRemoveUntil(NamedRoutes.login);
              } else if (state is VerifyFailure) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
              }
            },
            builder: (context, state) {
              return BackgroundContainer(
                child: Column(
                  children: [
                    CustomLogo(
                      isPhoneNumber: true,
                      lebal: "تفعيل الحساب",
                      subLebel:
                          "أدخل الكود المكون من 4 أرقام المرسل علي رقم الجوال",
                      fontSize: 15,
                      phoneNumber: "+${widget.phone}",
                      onChangePhoneNumber: () {
                        Navigator.pop(context);
                      },
                      textButton: "تغيير رقم الجوال",
                    ),
                    AppSpaces.getVerticalSpace(30),
                    PinCode(controller: controller),
                    CustomElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<VerifyCubit>().verify(
                            code: controller.text,
                            phone: widget.phone,
                          );
                        }
                      },
                      text: "تأكيد الكود",
                    ),
                    AppSpaces.getVerticalSpace(37),
                    Text(
                      "لم تستلم الكود ؟",
                      style: AppThemes.textLightTheme.labelMedium,
                    ),
                    Text(
                      "يمكنك إعادة إرسال الكود بعد",
                      style: AppThemes.textLightTheme.labelMedium,
                    ),
                    AppSpaces.getVerticalSpace(20),
                    CircularCountDownTimer(
                      controller: _countDownController,
                      autoStart: true,
                      isReverse: true,
                      isReverseAnimation: true,
                      backgroundColor: Colors.white,
                      width: 66.w,
                      height: 69.h,
                      duration: 30,
                      fillColor: Theme.of(context).primaryColor,
                      ringColor: Theme.of(context).disabledColor,
                      textStyle: TextStyle(
                        fontSize: 15.sp,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      textFormat: CountdownTextFormat.MM_SS,
                      onComplete: () {
                        setState(() {
                          _isResendEnabled = true;
                        });
                      },
                    ),
                    AppSpaces.getVerticalSpace(10),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: _isResendEnabled
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).disabledColor,
                        ),
                      ),
                      onPressed: _isResendEnabled
                          ? () {
                              if (_formKey.currentState!.validate()) {
                                context.read<VerifyCubit>().resendCode(
                                  phone: widget.phone,
                                );
                                setState(() {
                                  _isResendEnabled = false;
                                });
                                _countDownController.restart(duration: 50);
                              }
                            }
                          : null,
                      child: Text("إعادة الإرسال"),
                    ),
                    AppSpaces.getVerticalSpace(20),
                    Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'لديك حساب بالفعل ؟',
                            style: AppThemes.textLightTheme.labelMedium!
                                .copyWith(
                                  color: AppThemes.lightTheme.primaryColor,
                                ),
                          ),
                          TextButton(
                            onPressed: () {
                              AppRoutesFunc.replacement(NamedRoutes.login);
                            },
                            child: Text(
                              'تسجيل الدخول',
                              style: AppThemes.textLightTheme.labelLarge,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
