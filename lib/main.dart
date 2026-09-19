import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'screens/splash_screen.dart';
import 'theme/theme.dart';

void main() {
  runApp(
    // Kept per the proposal's runnability section. This makes the app
    // browsable at phone proportions from `flutter run -d web-server`,
    // and is easy to remove later by deleting this wrapper + builder line.
    DevicePreview(
      enabled: true,
      builder: (context) => const ThoughtFullApp(),
    ),
  );
}

class ThoughtFullApp extends StatelessWidget {
  const ThoughtFullApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ThoughtFull',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      // device_preview plumbing — required when DevicePreview is enabled.
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      home: const SplashScreen(),
    );
  }
}
