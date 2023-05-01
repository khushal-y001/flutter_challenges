import 'package:flutter/material.dart';

import '../constants/constants.dart';

class AppTextField extends StatelessWidget {
  final String? hintText;
  const AppTextField({Key? key, required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(10)),
        height: 50,
        child: Center(
          child: TextFormField(
            decoration:  InputDecoration(
              hintText: hintText??"",
              contentPadding:const EdgeInsets.only(left: 20),
              border: InputBorder.none,
            ),
          ),
        ));
  }
}
