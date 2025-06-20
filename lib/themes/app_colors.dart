import 'package:flutter/material.dart';

/// Kurumsal renk paleti. Ana ve yardımcı renkler merkezi olarak burada yönetilir.
/// Geliştirici ekibi için tüm renkler tek kaynaktan güncellenebilir.

class AppColors {
  // Ana renkler
  static const Color primary = Color(0xFFFE6600); // Turuncu
  static const Color primaryDark = Color(0xFFD94D00);
  static const Color primaryLight = Color(0xFFFF8A3D);

  static const Color secondary = Color(0xFF19191C); // Siyaha yakın koyu gri
  static const Color secondaryDark = Color(0xFF121214);
  static const Color secondaryLight = Color(0xFF2D2D34);

  // Nötr renkler
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color grey = Color(0xFFBDBDBD);
  static const Color greyLight = Color(0xFFF5F5F5);
  static const Color greyDark = Color(0xFF757575);

  // Durum renkleri
  static const Color success = Color(0xFF23C552);
  static const Color error = Color(0xFFEB5757);
  static const Color warning = Color(0xFFFFC107);
  static const Color info = Color(0xFF2D9CDB);

  // Ekstra örnek: Transparent overlay
  static const Color overlay = Color(0x88000000);
}
