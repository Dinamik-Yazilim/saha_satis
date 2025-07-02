/// The application screen represents the layout options.
enum AppLayouts {
  grid,
  list,
  // If necessary, other arrangements can be added here.
}

/// [AppLayouts] enum'ının string dönüşümlerini ve string'den enum'a dönüşümü sağlar.
extension AppLayoutsExtension on AppLayouts {
  /// Enum değerinin sadece ismini (string) döndürür.
  String toShortString() {
    return toString().split('.').last;
  }
}

///The given string converts the value to a [AppLayouts] enum value.
///If the match is not found, Null.
AppLayouts? appLayoutFromString(String? layoutString) {
  if (layoutString == null) return null;
  for (AppLayouts layout in AppLayouts.values) {
    if (layout.toShortString() == layoutString) {
      return layout;
    }
  }
  return null;
}
