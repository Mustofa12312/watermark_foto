import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'shared/routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Watermark Pro',
      theme: AppTheme.light,

      // Routing terpusat
      onGenerateRoute: AppRoutes.onGenerateRoute,
      initialRoute: AppRoutes.picker,
    );
  }
}
