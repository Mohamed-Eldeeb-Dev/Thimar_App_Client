import 'dart:async';

import 'package:flutter/material.dart';
import 'package:thimar_app/core/routes/app_routes_fun.dart';
import 'package:thimar_app/core/routes/routes.dart';
import 'package:thimar_app/gen/assets.gen.dart';
import 'package:thimar_app/models/user_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController logoController;
  late Animation<Offset> logoAnimation;

  late AnimationController leavesController;
  late Animation<Offset> leavesAnimation;

  Timer? _timer;

  @override
  void initState() {
    super.initState();

    UserModel.i.get();

    logoController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    logoAnimation = Tween<Offset>(
      begin: Offset(0, 2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: logoController, curve: Curves.easeOut));
    leavesController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    leavesAnimation = Tween<Offset>(
      begin: Offset(0, -10),
      end: Offset(0, -0.55),
    ).animate(CurvedAnimation(parent: leavesController, curve: Curves.easeOut));

    logoController.forward().then((_) {
      leavesController.forward();

      _timer = Timer(Duration(seconds: 2), () {
        if (mounted) {
          UserModel.i.isAuth
              ? AppRoutesFunc.replacement(NamedRoutes.bottomNavigationBarView)
              : AppRoutesFunc.replacement(NamedRoutes.login);
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    logoController.dispose();
    leavesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: -70,
            left: 50,
            child: Image.asset(Assets.images.vegetablesPaper.path),
          ),
          Positioned.fill(
            child: Image.asset(Assets.images.wall.path, fit: BoxFit.cover),
          ),
          Center(
            child: SlideTransition(
              position: logoAnimation,
              child: Stack(
                children: [
                  Image.asset(Assets.images.logo.path, width: 180),
                  SlideTransition(
                    position: leavesAnimation,
                    child: Image.asset(Assets.images.leaves.path, width: 180),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
