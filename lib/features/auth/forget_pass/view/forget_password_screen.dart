import 'package:flutter/material.dart';
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
import 'package:thimar_app/gen/assets.gen.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
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
            AppSpaces.getVerticalSpace(24),
            CustomElevatedButton(onPressed: () {
              AppRoutesFunc.push(NamedRoutes.verifyOfResetPassword);
            }, text: "تأكيد رقم الجوال"),
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
    );
  }
}
