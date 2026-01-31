import 'package:flutter/material.dart';

import '../features/picker/picker_screen.dart';
import '../features/settings/settings_screen.dart';

class AppRoutes {
  AppRoutes._();

  static const String picker = '/';
  static const String settings = '/settings';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case picker:
        return MaterialPageRoute(builder: (_) => const PickerScreen());

      case AppRoutes.settings:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());

      default:
        return MaterialPageRoute(builder: (_) => const PickerScreen());
    }
  }
}
