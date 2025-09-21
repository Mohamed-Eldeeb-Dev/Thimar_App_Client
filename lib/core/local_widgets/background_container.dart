import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/gen/assets.gen.dart';

class BackgroundContainer extends StatelessWidget {
  const BackgroundContainer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.images.wall.path),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16).r,
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: 1.sh),
            child: child,
          ),
        ),
      ),
    );
  }
}
