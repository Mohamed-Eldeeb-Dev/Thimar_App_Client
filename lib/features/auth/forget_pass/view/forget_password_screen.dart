import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thimar_app/core/local_widgets/background_container.dart';
import 'package:thimar_app/core/local_widgets/custom_elevated_button.dart';
import 'package:thimar_app/core/local_widgets/custom_logo.dart';
import 'package:thimar_app/core/local_widgets/custom_text_field.dart';
import 'package:thimar_app/core/local_widgets/phone_country_picker.dart';
import 'package:thimar_app/core/routes/app_routes_fun.dart';
import 'package:thimar_app/core/routes/routes.dart';
import 'package:thimar_app/core/utils/app_spaces.dart';
import 'package:thimar_app/core/utils/app_theme.dart';
import 'package:thimar_app/features/auth/forget_pass/cubit/forget_password_cubit.dart';
import 'package:thimar_app/gen/assets.gen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(),
      child: Form(
        key: _formKey,
        child: Scaffold(
          body: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
            listener: (context, state) {
              if (state is ForgetPasswordFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.errorMessage),
                    backgroundColor: Colors.red,
                  ),
                );
              } else if (state is ForgetPasswordSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('تم إرسال رمز إعادة التعيين بنجاح'),
                    backgroundColor: Colors.green,
                  ),
                );
                AppRoutesFunc.push(
                  NamedRoutes.verifyOfResetPassword,
                  arg: {'phone': phoneController.text},
                );
              }
            },
            builder: (context, state) {
              return BackgroundContainer(
                child: Column(
                  children: [
                    CustomLogo(
                      lebal: "نسيت كلمة المرور",
                      subLebel: "أدخل رقم الجوال المرتبط بحسابك",
                    ),
                    AppSpaces.getVerticalSpace(24),
                    Row(
                      children: [
                        PhoneCountryPicker(),
                        AppSpaces.getHorizontalSpace(9),
                        Expanded(
                          child: CustomTextField(
                            hintText: 'رقم الجوال',
                            prefixIcon: SvgPicture.asset(Assets.svgs.phone),
                            keyboardType: TextInputType.number,
                            controller: phoneController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'يرجى إدخال رقم الجوال';
                              } else if (value.length < 9) {
                                return 'يجب أن يكون رقم الجوال 10 أرقام على الأقل';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    AppSpaces.getVerticalSpace(24),
                    CustomElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          BlocProvider.of<ForgetPasswordCubit>(
                            context,
                          ).sendResetCode(phone: phoneController.text);
                        }
                      },
                      text: "تأكيد رقم الجوال",
                    ),
                    AppSpaces.getVerticalSpace(45),
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
                              AppRoutesFunc.pop();
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
