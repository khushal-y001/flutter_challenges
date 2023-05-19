import 'package:flutter/material.dart';

SnackBar snackBar(String message, {String? label, VoidCallback? onPressed}) => SnackBar(
      content: Text(message),
      action: SnackBarAction(
        label: label ?? '',
        onPressed: onPressed ?? () {},
      ),
    );
