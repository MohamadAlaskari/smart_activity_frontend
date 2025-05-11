import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:vibe_day/assets/colors.gen.dart';
import 'package:vibe_day/router.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
        routerDelegate: router.routerDelegate,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        builder: (context, child) {
          FlutterNativeSplash.remove();
          return Theme(
            data: ThemeData(
              useMaterial3: true,
              colorSchemeSeed: ColorName.blue,
              brightness: Brightness.light,
            ),
            child: child ?? Container(),
          );
        },
      ),
    );
  }
}