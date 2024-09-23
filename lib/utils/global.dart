import 'package:flutter/widgets.dart';
import 'package:manchaha/utils/app_keys.dart';

import 'app_enums.dart';

const Duration apiTimeOut = Duration(minutes: 2);
BuildType appBuildType = BuildType.dev;

Widget gapH(double h) => SizedBox(height: h);

Widget gapW(double w) => SizedBox(width: w);

BuildContext get ctx => WidgetKeys.navigatorKey.currentState!.context;

double get h => MediaQuery.of(ctx).size.height;

double get w => MediaQuery.of(ctx).size.width;
