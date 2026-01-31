import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'features/navigation/navigation_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lens Mark',
      theme: AppTheme.light,

      // Root aplikasi sekarang adalah Bottom Navigation
      home: const NavigationScreen(),
    );
  }
}
