import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'my_app.dart';
import 'screens/error_widget.dart';
import 'utils/app_perferences.dart';

// starting point of app
Future main() async {
  await ScreenUtil.ensureScreenSize();
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences.init(); // intializing shared prefrences
  //custom error widget on ==>>> flutter error
  ErrorWidget.builder = (details) {
    return ErrorUI(
      exception: details.exception,
    );
  };
  //root widget
  runApp(
    const MyApp(),
  );
}
