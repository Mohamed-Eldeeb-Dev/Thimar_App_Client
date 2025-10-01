import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thimar_app/core/local_widgets/background_container.dart';
import 'package:thimar_app/core/local_widgets/custom_elevated_button.dart';
import 'package:thimar_app/core/local_widgets/custom_logo.dart';
import 'package:thimar_app/core/local_widgets/custom_text_field.dart';
import 'package:thimar_app/core/routes/app_routes_fun.dart';
import 'package:thimar_app/core/routes/routes.dart';
import 'package:thimar_app/core/utils/app_spaces.dart';
import 'package:thimar_app/core/utils/app_theme.dart';
import 'package:thimar_app/core/utils/unfucs.dart';
import 'package:thimar_app/gen/assets.gen.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Unfocus(
        child: Scaffold(
          body: BackgroundContainer(
            child: Column(
              children: [
                CustomLogo(
                  lebal: "نسيت كلمة المرور",
                  subLebel: "أدخل كلمة المرور الجديدة",
                ),
                AppSpaces.getVerticalSpace(24),
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
                    // if (_formKey.currentState!.validate()) {
                    AppRoutesFunc.push(NamedRoutes.login);
                    // }
                  },
                  text: "تغيير كلمة المرور",
                ),
                AppSpaces.getVerticalSpace(45),
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'لديك حساب بالفعل ؟',
                        style: AppThemes.textLightTheme.labelMedium!.copyWith(
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
          ),
        ),
      ),
    );
  }
}
