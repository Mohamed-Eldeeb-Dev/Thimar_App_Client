import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';  
import 'package:thimar_app/features/home/view/home_screen.dart';
import 'package:thimar_app/features/profile/view/profile_screen.dart';
import 'package:thimar_app/gen/assets.gen.dart';
import '../../favorites/view/favorites_screen.dart';
import '../../notifications/view/notifications_screen.dart';
import '../../orders/view/orders_screen.dart';

class BottomNavigationBarView extends StatefulWidget {
  const BottomNavigationBarView({super.key});

  @override
  State<BottomNavigationBarView> createState() =>
      _BottomNavigationBarViewState();
}

class _BottomNavigationBarViewState extends State<BottomNavigationBarView> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const HomeScreen(),
    const OrdersScreen(),
    const NotificationsScreen(),
    const FavoritesScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: NavigationBar(
        height: 70.h,
        backgroundColor: Theme.of(context).primaryColor,
        indicatorColor: Colors.transparent,
        animationDuration: Duration(milliseconds: 300),
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) => setState(() => _currentIndex = index),
        destinations: [
          NavigationDestination(
            icon: SvgPicture.asset(Assets.svgs.home),
            selectedIcon: SvgPicture.asset(Assets.svgs.homeFilled),
            label: 'الرئيسية',
          ),
          NavigationDestination(
            icon: SvgPicture.asset(Assets.svgs.note),
            selectedIcon: SvgPicture.asset(Assets.svgs.noteFilled),
            label: 'طلباتي',
          ),
          NavigationDestination(
            icon: SvgPicture.asset(Assets.svgs.notification),
            selectedIcon: SvgPicture.asset(Assets.svgs.notificationFilled),
            label: 'الإشعارات',
          ),
          NavigationDestination(
            icon: SvgPicture.asset(Assets.svgs.heart),
            selectedIcon: SvgPicture.asset(Assets.svgs.heartFilled),
            label: 'المفضلة',
          ),
          NavigationDestination(
            icon: SvgPicture.asset(Assets.svgs.profile),
            selectedIcon: SvgPicture.asset(Assets.svgs.profileFilled),
            label: 'حسابي',
          ),
        ],
      ),
    );
  }
}
