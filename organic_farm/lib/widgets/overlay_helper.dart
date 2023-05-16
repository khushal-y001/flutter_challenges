import 'package:flutter/material.dart';
import 'package:organic_farm/constants/app_colors.dart';
import '../../constants/constants.dart';

class OverLayHelper {
  static modalBottomSheet(BuildContext context, {required Widget Function(BuildContext) builder}) =>
      showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          useSafeArea: true,
          backgroundColor: AppColors.grey150,
          builder: builder);
}
