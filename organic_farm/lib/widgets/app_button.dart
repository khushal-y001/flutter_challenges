import 'package:flutter/material.dart';

import '../constants/constants.dart';
class AppButton extends StatelessWidget {
   final Widget? child;
   final Color? backgroundColor;
   final Function()? onPressed;
  const AppButton({Key? key, required this.onPressed,required this.child, this.backgroundColor = AppColors.yellow400 }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(onPressed: onPressed,style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: backgroundColor
      ),
      child: child),
    );
  }
}
