// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import '../utils/style/app_styles.dart';

// custom error widget on flutter error red screen
class ErrorUI extends StatelessWidget {
  final exception;

  const ErrorUI({super.key, this.exception});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        'Error\n$exception',
        style: AppStyles.baseFont,
        textAlign: TextAlign.center,
      ),
    );
  }
}
