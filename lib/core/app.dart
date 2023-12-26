import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venue_look/proximity_brightness_control.dart';

import '../config/router/app_route.dart';
import '../config/theme/app_theme.dart';
import 'common/provider/is_dark_theme.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkTheme = ref.watch(isDarkThemeProvider);
    return ProximityBrightnessControl(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.getApplicationTheme(isDarkTheme),
        initialRoute: AppRoute.splashRoute,
        routes: AppRoute.getApplicationRoute(),
      ),
    );
  }
}
