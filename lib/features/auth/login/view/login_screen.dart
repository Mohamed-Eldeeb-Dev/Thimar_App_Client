import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
import 'package:thimar_app/core/utils/extensions.dart';
import 'package:thimar_app/core/utils/unfucs.dart';
import 'package:thimar_app/features/auth/login/cubit/login_cubit.dart';
import 'package:thimar_app/gen/assets.gen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Form(
        key: _formKey,
        child: Unfocus(
          child: Scaffold(
            body: BackgroundContainer(
              child: BlocConsumer<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state is LoginSuccess) {
                    AppRoutesFunc.pushAndRemoveUntil(
                      NamedRoutes.bottomNavigationBarView,
                    );
                  } else if (state is LoginFailure) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
                  }
                },
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomLogo(
                        lebal: 'مرحبا بك مرة أخرى',
                        subLebel: 'يمكنك تسجيل الدخول الأن',
                      ),
                      AppSpaces.getVerticalSpace(28),
                      Row(
                        children: [
                          PhoneCountryPicker(),
                          AppSpaces.getHorizontalSpace(9),
                          Expanded(
                            child: CustomTextField(
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              maxLength: 13,
                              hintText: 'رقم الجوال',
                              prefixIcon: SvgPicture.asset(Assets.svgs.phone),
                              keyboardType: TextInputType.number,
                              controller: phoneController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'يرجى إدخال رقم الجوال';
                                } else if (value.length < 10) {
                                  return 'يجب أن يكون رقم الجوال 10 أرقام على الأقل';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      AppSpaces.getVerticalSpace(16),
                      CustomTextField(
                        hintText: "كلمة المرور",
                        prefixIcon: SvgPicture.asset(Assets.svgs.unlock),
                        obscureText: true,
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'يرجى إدخال كلمة المرور';
                          }
                          if (value.length < 6) {
                            return 'يجب أن تكون كلمة المرور 6 أحرف على الأقل';
                          }
                          return null;
                        },
                      ),
                      AppSpaces.getVerticalSpace(15),
                      TextButton(
                        onPressed: () {
                          AppRoutesFunc.push(NamedRoutes.resetPassword);
                        },
                        child: Text(
                          'نسيت كلمة المرور ؟',
                          style: AppThemes.textLightTheme.labelMedium,
                        ),
                      ).toBottomEnd,
                      AppSpaces.getVerticalSpace(15),
                      CustomElevatedButton(
                        onPressed: () {                      
                          if (_formKey.currentState!.validate()) {
                            context.read<LoginCubit>().login(
                              phone: phoneController.text,
                              password: passwordController.text,
                            );
                          }
                        },
                        text: state is LoginLoading
                            ? 'جارٍ تسجيل الدخول...'
                            : 'تسجيل الدخول',
                      ),

                      AppSpaces.getVerticalSpace(45),
                      Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'ليس لديك حساب ؟',
                              style: AppThemes.textLightTheme.labelMedium!
                                  .copyWith(
                                    color: AppThemes.lightTheme.primaryColor,
                                  ),
                            ),
                            TextButton(
                              onPressed: () {
                                AppRoutesFunc.push(NamedRoutes.register);
                              },
                              child: Text(
                                'تسجيل الأن',
                                style: AppThemes.textLightTheme.labelLarge,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
