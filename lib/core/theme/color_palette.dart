import 'package:flutter/material.dart';

/// Centralized color system
/// Jangan pakai warna langsung di widget
class AppColors {
  AppColors._();

  // Base
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);

  // Neutral
  static const Color gray900 = Color(0xFF121212);
  static const Color gray700 = Color(0xFF2C2C2C);
  static const Color gray500 = Color(0xFF6B6B6B);
  static const Color gray300 = Color(0xFFBDBDBD);
  static const Color gray100 = Color(0xFFF2F2F2);

  // Accent (dipakai secukupnya)
  static const Color accent = Color(0xFF1E1E1E);
}
