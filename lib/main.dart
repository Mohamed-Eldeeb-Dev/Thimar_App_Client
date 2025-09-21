import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/routes/app_routes.dart';
import 'package:thimar_app/core/routes/app_routes_fun.dart';
import 'package:thimar_app/core/utils/app_theme.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          builder: (context, child) {
            return Directionality(textDirection: TextDirection.rtl, child: child!);
          },
          title: 'Thimar',
          themeMode: ThemeMode.light,
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.lightTheme,
          initialRoute: AppRoutes.init.initial,
          routes: AppRoutes.init.appRoutes,
          navigatorKey: AppRoutesFunc.navigator,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
