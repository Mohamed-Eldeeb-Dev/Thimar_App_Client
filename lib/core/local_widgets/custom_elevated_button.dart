import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.isloading = false,
  });
  final VoidCallback onPressed;
  final String text;
  final bool? isloading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      height: 60.h,
      child: ElevatedButton(
        onPressed: onPressed,
        child: isloading! ? CircularProgressIndicator() : Text(text),
      ),
    );
  }
}
