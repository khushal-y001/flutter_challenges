import 'package:flutter/material.dart';
import 'package:organic_farm/constants/app_colors.dart';

class AppButton extends StatelessWidget {
  final Widget? child;
  final Color? backgroundColor;
  final Function()? onPressed;
  const AppButton(
      {Key? key,
      required this.onPressed,
      required this.child,
      this.backgroundColor = AppColors.yellowMain})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              backgroundColor: backgroundColor),
          child: child),
    );
  }
}
