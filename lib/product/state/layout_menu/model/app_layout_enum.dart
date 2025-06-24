// app_layout_enum.dart
/// Uygulama ekranı düzeni seçeneklerini temsil eder.
enum AppLayouts {
  grid, // Izgara düzeni (varsayılan)
  list, // Liste düzeni
  // İhtiyaç halinde buraya başka düzenler de eklenebilir.
}

/// [AppLayouts] enum'ının string dönüşümlerini ve string'den enum'a dönüşümü sağlar.
extension AppLayoutsExtension on AppLayouts {
  /// Enum değerinin sadece ismini (string) döndürür.
  String toShortString() {
    return toString().split('.').last;
  }
}

/// Verilen string değeri bir [AppLayouts] enum değerine dönüştürür.
/// Eşleşme bulunamazsa null döner.
AppLayouts? appLayoutFromString(String? layoutString) {
  if (layoutString == null) return null;
  for (AppLayouts layout in AppLayouts.values) {
    if (layout.toShortString() == layoutString) {
      return layout;
    }
  }
  return null;
}
