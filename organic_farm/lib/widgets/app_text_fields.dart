import 'package:flutter/material.dart';

import '../constants/constants.dart';

class AppTextField extends StatelessWidget {
  final String? hintText;
  final String? errorText;
  final bool obscureText;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  const AppTextField(
      {Key? key,
      required this.hintText,
      this.errorText,
      required this.onChanged,
      this.controller,
      this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(10)),
        height: 50,
        child: Center(
          child: TextFormField(
            obscureText: obscureText,
            controller: controller,
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: hintText ?? "",
              contentPadding: const EdgeInsets.only(left: 20, right: 20),
              border: InputBorder.none,
              errorText: errorText,
            ),
          ),
        ));
  }
}
