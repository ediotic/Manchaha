import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppNavigation {
  //Push a named route onto the page stack w/ optional parameters,
  static pushNamed(
    BuildContext context,
    routeName, {
    Object? extra,
    Map<String, String>? pathParameters,
    Map<String, dynamic>? queryParameters,
  }) {
    return GoRouter.of(context)
        .pushNamed(
          routeName,
          extra: extra,
          pathParameters: pathParameters ?? {},
          queryParameters: queryParameters ?? {},
        )
        .then((_) {});
  }

  //Replaces the top-most page of the page stack with the given URL location w/ optional query parameters.
  static pushReplacement(BuildContext context, routeName, {Object? extra}) {
    return GoRouter.of(context).pushReplacement(
      routeName,
      extra: extra,
    );
  }

  //Navigate to a named route w/ optional parameters.
  static goNamed(
    BuildContext context,
    routeName, {
    Object? extra,
    Map<String, String>? pathParameters,
    Map<String, dynamic>? queryParameters,
  }) {
    return GoRouter.of(context).goNamed(
      routeName,
      extra: extra,
      pathParameters: pathParameters ?? {},
      queryParameters: queryParameters ?? {},
    );
  }

  //Pop the top-most route off the current screen.
  static pop(BuildContext context) {
    return GoRouter.of(context).pop();
  }
}
