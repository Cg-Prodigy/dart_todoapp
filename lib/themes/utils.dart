import 'package:flutter/material.dart';

// ── Color helpers ───────────────────────────────────────────────────

/// Lays [fg] at [t] opacity over [bg] and returns the blended color.
Color mixColor(Color fg, Color bg, double t) =>
    Color.alphaBlend(fg.withValues(alpha: t), bg);

Color darkenColor(Color c, double amount) {
  final hsl = HSLColor.fromColor(c);
  return hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0)).toColor();
}

Color lightenColor(Color c, double amount) {
  final hsl = HSLColor.fromColor(c);
  return hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0)).toColor();
}

// ── Status colors Flutter has no slot for ───────────────────────────
// Read with: Theme.of(context).extension<StatusColors>()!.success

@immutable
class StatusColors extends ThemeExtension<StatusColors> {
  const StatusColors({
    required this.info,
    required this.onInfo,
    required this.success,
    required this.onSuccess,
    required this.warning,
    required this.onWarning,
  });

  final Color info, onInfo, success, onSuccess, warning, onWarning;

  @override
  StatusColors copyWith({
    Color? info,
    Color? onInfo,
    Color? success,
    Color? onSuccess,
    Color? warning,
    Color? onWarning,
  }) => StatusColors(
    info: info ?? this.info,
    onInfo: onInfo ?? this.onInfo,
    success: success ?? this.success,
    onSuccess: onSuccess ?? this.onSuccess,
    warning: warning ?? this.warning,
    onWarning: onWarning ?? this.onWarning,
  );

  @override
  StatusColors lerp(StatusColors? other, double t) {
    if (other == null) return this;
    return StatusColors(
      info: Color.lerp(info, other.info, t)!,
      onInfo: Color.lerp(onInfo, other.onInfo, t)!,
      success: Color.lerp(success, other.success, t)!,
      onSuccess: Color.lerp(onSuccess, other.onSuccess, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      onWarning: Color.lerp(onWarning, other.onWarning, t)!,
    );
  }
}

// ── Shared ThemeData builder (component themes + legacy colors) ─────

ThemeData buildCorporateTheme({
  required ColorScheme scheme,
  required StatusColors status,
  required Color border, // base-300
  required double radiusSelector, // --radius-selector in px
  required double radiusField, // --radius-field in px
  required double radiusBox, // --radius-box in px
  double borderWidth = 1, // --border
  double depth = 0, // --depth, used as elevation
}) {
  final onSurface = scheme.onSurface;
  final surface = scheme.surface;

  RoundedRectangleBorder rounded(
    double r, {
    BorderSide side = BorderSide.none,
  }) => RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(r),
    side: side,
  );

  OutlineInputBorder field(Color c, double w) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(radiusField),
    borderSide: BorderSide(color: c, width: w),
  );

  return ThemeData(
    useMaterial3: true,
    brightness: scheme.brightness,
    colorScheme: scheme,

    // Legacy top-level colors, pinned so nothing falls back to defaults
    primaryColor: scheme.primary,
    primaryColorLight: mixColor(scheme.primary, surface, 0.60),
    primaryColorDark: darkenColor(scheme.primary, 0.15),
    canvasColor: surface,
    scaffoldBackgroundColor: surface,
    cardColor: surface,
    dividerColor: border,
    dialogBackgroundColor: surface,
    disabledColor: mixColor(onSurface, surface, 0.30),
    hintColor: mixColor(onSurface, surface, 0.60),
    highlightColor: scheme.primary.withValues(alpha: 0.10),
    splashColor: scheme.primary.withValues(alpha: 0.12),
    hoverColor: onSurface.withValues(alpha: 0.05),
    focusColor: scheme.primary.withValues(alpha: 0.15),
    indicatorColor: scheme.primary,
    shadowColor: Colors.black,
    secondaryHeaderColor: scheme.surfaceContainer,
    unselectedWidgetColor: mixColor(onSurface, surface, 0.60),

    extensions: [status],

    cardTheme: CardThemeData(
      color: surface,
      elevation: depth,
      shape: rounded(
        radiusBox,
        side: BorderSide(color: border, width: borderWidth),
      ),
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: surface,
      elevation: depth,
      shape: rounded(radiusBox),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: surface,
      border: field(border, borderWidth),
      enabledBorder: field(border, borderWidth),
      focusedBorder: field(scheme.primary, 2),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        elevation: depth,
        shape: rounded(radiusField),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: depth,
        shape: rounded(radiusField),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: rounded(radiusField),
        side: BorderSide(color: border, width: borderWidth),
      ),
    ),
    checkboxTheme: CheckboxThemeData(shape: rounded(radiusSelector)),
    chipTheme: ChipThemeData(shape: rounded(radiusSelector)),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: scheme.inverseSurface,
      contentTextStyle: TextStyle(color: scheme.onInverseSurface),
      behavior: SnackBarBehavior.floating,
      shape: rounded(radiusField),
    ),
  );
}
