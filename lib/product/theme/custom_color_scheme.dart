import 'package:flutter/material.dart';

/// Project custom colors
final class CustomColorScheme {
  CustomColorScheme._();

  /// Light color scheme set
  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF2D3047), // Ana marka rengi: Koyu Mavi-Gri (güncellendi)
    surfaceTint: Color(0xFF2D3047), // Primary ile aynı (güncellendi)
    onPrimary: Color(0xFFFFFFFF), // Primary üzerinde beyaz metin
    primaryContainer: Color(0xFFC8CBDA), // Primary'nin açık tonu (güncellendi)
    onPrimaryContainer: Color(0xFF1A1D2D), // PrimaryContainer üzerinde koyu metin (güncellendi)
    secondary: Color(0xFF4A635E), // İkincil renk: Gri-Yeşil
    onSecondary: Color(0xFFFFFFFF), // Secondary üzerinde beyaz metin
    secondaryContainer: Color(0xFFCCE8E1), // Secondary'nin açık tonu
    onSecondaryContainer: Color(0xFF06201C), // SecondaryContainer üzerinde koyu metin
    tertiary: Color(0xFF4A627B), // Üçüncül renk: Koyu Mavi-Gri
    onTertiary: Color(0xFFFFFFFF), // Tertiary üzerinde beyaz metin
    tertiaryContainer: Color(0xFFD1E4FF), // Tertiary'nin açık tonu
    onTertiaryContainer: Color(0xFF051E34), // TertiaryContainer üzerinde koyu metin
    error: Color(0xFFBA1A1A), // Hata rengi: Kırmızı
    onError: Color(0xFFFFFFFF), // Hata üzerinde beyaz metin
    errorContainer: Color(0xFFFFDAD6), // Hata renginin açık tonu
    onErrorContainer: Color(0xFF410002), // HataContainer üzerinde koyu metin
    surface: Color(0xFFFBFDFB), // Arka plan yüzey rengi: Çok açık gri
    onSurface: Color(0xFF191C1B), // Surface üzerinde koyu metin
    onSurfaceVariant: Color(0xFF404945), // Surface varyantı üzerinde koyu metin
    outline: Color(0xFF6F7976), // Ana hat rengi: Gri
    outlineVariant: Color(0xFFBFC9C5), // Ana hat varyantı
    shadow: Color(0xff000000), // Gölge rengi
    scrim: Color(0xff000000), // Ekran karartma rengi
    inverseSurface: Color(0xFF2E3130), // Ters yüzey rengi (koyu mod için)
    inversePrimary: Color(0xFFB0B3C8), // Ters primary (koyu modun primary'si) (güncellendi)
    primaryFixed: Color(0xFFC8CBDA), // Primary'nin sabit açık tonu (güncellendi)
    onPrimaryFixed: Color(0xFF1A1D2D), // PrimaryFixed üzerinde koyu metin (güncellendi)
    primaryFixedDim: Color(0xFFB0B3C8), // Primary'nin sabit açık tonu (dim) (güncellendi)
    onPrimaryFixedVariant: Color(0xFF444863), // PrimaryFixedVariant üzerinde koyu metin (güncellendi)
    secondaryFixed: Color(0xFFCCE8E1),
    onSecondaryFixed: Color(0xFF06201C),
    secondaryFixedDim: Color(0xFFB0CCC5),
    onSecondaryFixedVariant: Color(0xFF334B46),
    tertiaryFixed: Color(0xFFD1E4FF),
    onTertiaryFixed: Color(0xFF051E34),
    tertiaryFixedDim: Color(0xFFAFC7E5),
    onTertiaryFixedVariant: Color(0xFF334B63),
    surfaceDim: Color(0xFFD9DBDA),
    surfaceBright: Color(0xFFFBFDFB),
    surfaceContainerLowest: Color(0xFFFFFFFF),
    surfaceContainerLow: Color(0xFFF3F6F5),
    surfaceContainer: Color(0xFFEDF0EF),
    surfaceContainerHigh: Color(0xFFE7ECEB),
    surfaceContainerHighest: Color(0xFFE2E6E5),
  );

  /// Dark color scheme set
  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFB0B3C8), // Ana marka rengi: Açık Mavi-Gri (koyu mod için) (güncellendi)
    surfaceTint: Color(0xFFB0B3C8), // Primary ile aynı (güncellendi)
    onPrimary: Color(0xFF1A1D2D), // Primary üzerinde koyu metin (güncellendi)
    primaryContainer: Color(0xFF444863), // Primary'nin koyu tonu (güncellendi)
    onPrimaryContainer: Color(0xFFC8CBDA), // PrimaryContainer üzerinde açık metin (güncellendi)
    secondary: Color(0xFFB0CCC5), // İkincil renk: Açık Gri-Yeşil
    onSecondary: Color(0xFF1D3531), // Secondary üzerinde koyu metin
    secondaryContainer: Color(0xFF334B46), // Secondary'nin koyu tonu
    onSecondaryContainer: Color(0xFFCCE8E1), // SecondaryContainer üzerinde açık metin
    tertiary: Color(0xFFAFC7E5), // Üçüncül renk: Açık Mavi-Gri
    onTertiary: Color(0xFF1A334A), // Tertiary üzerinde koyu metin
    tertiaryContainer: Color(0xFF334B63), // Tertiary'nin koyu tonu
    onTertiaryContainer: Color(0xFFD1E4FF), // TertiaryContainer üzerinde açık metin
    error: Color(0xFF93000A), // Hata rengi: Kırmızı
    onError: Color(0xFF690005), // Hata üzerinde koyu metin
    errorContainer: Color(0xFF93000A), // Hata renginin koyu tonu
    onErrorContainer: Color(0xFFFFDAD6), // HataContainer üzerinde açık metin
    surface: Color(0xFF111413), // Arka plan yüzey rengi: Çok koyu gri
    onSurface: Color(0xFFE2E6E5), // Surface üzerinde açık metin
    onSurfaceVariant: Color(0xFFBFC9C5), // Surface varyantı üzerinde açık metin
    outline: Color(0xFF899390), // Ana hat rengi: Gri
    outlineVariant: Color(0xFF404945), // Ana hat varyantı
    shadow: Color(0xff000000), // Gölge rengi
    scrim: Color(0xff000000), // Ekran karartma rengi
    inverseSurface: Color(0xFFE2E6E5), // Ters yüzey rengi (açık mod için)
    inversePrimary: Color(0xFF2D3047), // Ters primary (açık modun primary'si) (güncellendi)
    primaryFixed: Color(0xFFC8CBDA), // Primary'nin sabit açık tonu (güncellendi)
    onPrimaryFixed: Color(0xFF1A1D2D), // PrimaryFixed üzerinde koyu metin (güncellendi)
    primaryFixedDim: Color(0xFFB0B3C8), // Primary'nin sabit açık tonu (dim) (güncellendi)
    onPrimaryFixedVariant: Color(0xFF444863), // PrimaryFixedVariant üzerinde koyu metin (güncellendi)
    secondaryFixed: Color(0xFFCCE8E1),
    onSecondaryFixed: Color(0xFF06201C),
    secondaryFixedDim: Color(0xFFB0CCC5),
    onSecondaryFixedVariant: Color(0xFF334B46),
    tertiaryFixed: Color(0xFFD1E4FF),
    onTertiaryFixed: Color(0xFF051E34),
    tertiaryFixedDim: Color(0xFFAFC7E5),
    onTertiaryFixedVariant: Color(0xFF334B63),
    surfaceDim: Color(0xFF111413),
    surfaceBright: Color(0xFF373A39),
    surfaceContainerLowest: Color(0xFF0C0F0E),
    surfaceContainerLow: Color(0xFF191C1B),
    surfaceContainer: Color(0xFF1D201F),
    surfaceContainerHigh: Color(0xFF282B2A),
    surfaceContainerHighest: Color(0xFF333635),
  );
}
