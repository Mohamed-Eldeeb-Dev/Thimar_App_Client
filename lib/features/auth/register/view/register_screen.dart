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
import 'package:thimar_app/core/utils/unfucs.dart';
import 'package:thimar_app/features/auth/register/cubit/register_cubit.dart';
import 'package:thimar_app/gen/assets.gen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController townController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    nameController.dispose();
    townController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Form(
        key: _formKey,
        child: Unfocus(
          child: Scaffold(
            body: BlocConsumer<RegisterCubit, RegisterState>(
              listener: (context, state) {
                final phone = phoneController.text;
                if (state is RegisterSuccess) {
                  AppRoutesFunc.push(NamedRoutes.verify, arg: {"phone": phone});
                } else if (state is RegisterFailure) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
                }
              },
              builder: (context, state) {
                return BackgroundContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomLogo(
                        lebal: "مرحبا بك مرة أخرى",
                        subLebel: "يمكنك تسجيل حساب جديد الأن",
                      ),
                      AppSpaces.getVerticalSpace(24),
                      CustomTextField(
                        hintText: "اسم المستخدم",
                        prefixIcon: SvgPicture.asset(Assets.svgs.user),
                        controller: nameController,
                        keyboardType: TextInputType.name,
                        onChanged: (value) {},
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'يرجى إدخال الاسم';
                          }
                          if (value.length < 3) {
                            return 'يجب أن يكون الاسم 3 أحرف على الأقل';
                          }
                          return null;
                        },
                      ),
                      AppSpaces.getVerticalSpace(16),
                      Row(
                        children: [
                          PhoneCountryPicker(),
                          AppSpaces.getHorizontalSpace(9),
                          Expanded(
                            child: CustomTextField(
                              maxLength: 10,
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
                        hintText: "المدينة",
                        prefixIcon: SvgPicture.asset(Assets.svgs.flag),
                        controller: townController,
                        keyboardType: TextInputType.text,
                        onChanged: (value) {},
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'يرجى إدخال المدينة';
                          }
                          return null;
                        },
                      ),
                      AppSpaces.getVerticalSpace(16),
                      CustomTextField(
                        hintText: "كلمة المرور",
                        prefixIcon: SvgPicture.asset(Assets.svgs.unlock),
                        obscureText: true,
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        onChanged: (value) {},
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
                      AppSpaces.getVerticalSpace(16),
                      CustomTextField(
                        hintText: "كلمة المرور",
                        prefixIcon: SvgPicture.asset(Assets.svgs.unlock),
                        obscureText: true,
                        controller: confirmPasswordController,
                        keyboardType: TextInputType.visiblePassword,
                        onChanged: (value) {},
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value != passwordController.text) {
                            return 'كلمة المرور غير متطابقة';
                          }

                          return null;
                        },
                      ),
                      AppSpaces.getVerticalSpace(24),
                      CustomElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<RegisterCubit>().register(
                              name: nameController.text,
                              phone: phoneController.text,
                              password: passwordController.text,
                              passwordConfirmation:
                                  confirmPasswordController.text,
                              city: townController.text,
                            );
                          }
                        },
                        text: state is RegisterLoading
                            ? 'جارٍ التسجيل...'
                            : "تسجيل",
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
      ),
    );
  }
}
