import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_keys.dart';
import '../../utils/app_methods.dart';
import '../../utils/app_routes.dart';
import '../../utils/app_theme.dart';
import 'global_provider.dart';
import 'provider_consumer.dart';

//Provider Consumer class
class ProviderWrapper extends StatelessWidget {
  const ProviderWrapper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //provider consumer
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      child: ProviderConsumer<GlobalProvider>(
        //default view with Material App
        defaultView: (context, provider, child) => MaterialApp.router(
          scaffoldMessengerKey: WidgetKeys.globalKey,
          supportedLocales: supportedLocales,
          locale: DevicePreview.locale(context),
          debugShowCheckedModeBanner: false,
          // title: AppStrings.appName,
          theme: AppTheme().lightTheme(),
          routerConfig: AppRouter.goRouter,
        ),
      ),
    );
  }
}
