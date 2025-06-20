import 'package:flutter/material.dart';

/// Kasa & Randevu uygulaması için kapsamlı renk paleti.
/// Kurumsal, modern ve kolay yönetilebilir.
/// Gelir-gider, randevu, kategori, durum ve tema renklerini içerir.
class AppColors {
  // -- Ana renkler (Kasa/Finans)
  static const Color primary = Color(0xFF2E70F2);     // Parlak mavi
  static const Color primaryLight = Color(0xFF6FA9FF);
  static const Color primaryDark = Color(0xFF14488C);

  static const Color accent = Color(0xFFFE6600);      // Turuncu vurgu

  // -- Kasa fonksiyonları
  static const Color expense = Color(0xFFFF6B6B);     // Harcama, gider (kırmızımsı pembe)
  static const Color darkExpense = Color(0xFFD33A2C); // Koyu gider
  static const Color income = Color(0xFF23C552);      // Gelir (yeşil)
  static const Color darkIncome = Color(0xFF15803D);  // Koyu gelir

  static const Color neutral = Color(0xFFF5F7FA);     // Nötr arka plan (kartlar için)
  static const Color neutralDark = Color(0xFF2D3748); // Dark mode nötr arka plan

  // -- Randevu Durumları
  static const Color pending = Color(0xFFFFC107);     // Bekliyor (sarı)
  static const Color confirmed = Color(0xFF2E70F2);   // Onaylandı (mavi)
  static const Color completed = Color(0xFF23C552);   // Tamamlandı (yeşil)
  static const Color cancelled = Color(0xFFEB5757);   // İptal (kırmızı)
  static const Color noShow = Color(0xFF757575);      // Gelmedi (gri)

  // -- Kategori Renkleri
  static const Color categoryBlue = Color(0xFF53BFF9);    // Sağlık/finans
  static const Color categoryOrange = Color(0xFFFFA726);  // Restoran/kafe
  static const Color categoryGreen = Color(0xFF5CC694);   // Market, genel alışveriş
  static const Color categoryPurple = Color(0xFF7B61FF);  // Kişisel/özel
  static const Color categoryPink = Color(0xFFFF74B3);    // Eğlence/kişisel
  static const Color categoryGrey = Color(0xFFBDBDBD);    // Diğer

  // -- Temel renkler
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF191C1E);
  static const Color grey = Color(0xFFF5F7FA);
  static const Color greyDark = Color(0xFFAAB3BC);
  static const Color divider = Color(0xFFE3EAF2);

  // -- Durumlar
  static const Color success = Color(0xFF23C552);    // Genel başarılı işlem
  static const Color error = Color(0xFFEB5757);      // Hata
  static const Color warning = Color(0xFFFFC107);    // Uyarı
  static const Color info = Color(0xFF53BFF9);       // Bilgi

  // -- Dark Theme
  static const Color darkBg = Color(0xFF121212);
  static const Color darkCard = Color(0xFF191C1E);
  static const Color darkDivider = Color(0xFF23272F);
  static const Color darkText = Color(0xFFE3EAF2);

  // -- Overlay
  static const Color overlay = Color(0x88000000);

  // -- Extra (border, shadow vs.)
  static const Color border = Color(0xFFE3EAF2);
  static const Color shadow = Color(0x1A191C1E); // %10 opacity

  // -- Renk kullanımı için yardımcı örnekler
  // static const Map<String, Color> appointmentStatus = {
  //   'pending': pending,
  //   'confirmed': confirmed,
  //   'completed': completed,
  //   'cancelled': cancelled,
  //   'noShow': noShow,
  // };
}
