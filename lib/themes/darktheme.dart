import 'package:flutter/material.dart';

import 'utils.dart';

// ── Direct DaisyUI values (OKLCH → sRGB) ────────────────────────────
const _base100 = Color(0xFF010515);
const _base200 = Color(0xFF0D1529);
const _base300 = Color(0xFF1A273A);
const _baseContent = Color(0xFFEEF2F6);

const _primary = Color(0xFFFF8904);
const _primaryContent = Color(0xFF421104);
const _secondary = Color(0xFF000000);
const _secondaryContent = Color(0xFFFFFFFF);
const _accent = Color(0xFF4EA0FF);
const _accentContent = Color(0xFF162455);
const _neutral = Color(0xFF1A273A);
const _neutralContent = Color(0xFFF7F9FA);

const _info = Color(0xFF00D0EF);
const _infoContent = Color(0xFF053344);
const _success = Color(0xFF00D390);
const _successContent = Color(0xFF002C21);
const _warning = Color(0xFFFDC700);
const _warningContent = Color(0xFF411E03);
const _error = Color(0xFFFF6266);
const _errorContent = Color(0xFF440607);

// ── Derived container roles (tinted wash over base-100) ─────────────
final _primaryContainer = mixColor(_primary, _base100, 0.25);
final _tertiaryContainer = mixColor(_accent, _base100, 0.25);
final _errorContainer = mixColor(_error, _base100, 0.25);
final _surfaceHighest = mixColor(_baseContent, _base300, 0.06);

final corporateDarkColorScheme = ColorScheme(
  brightness: Brightness.dark,

  // Primary
  primary: _primary,
  onPrimary: _primaryContent,
  primaryContainer: _primaryContainer,
  onPrimaryContainer: lightenColor(_primary, 0.15),
  primaryFixed: mixColor(_primary, Colors.white, 0.35),
  primaryFixedDim: mixColor(_primary, Colors.white, 0.60),
  onPrimaryFixed: _primaryContent,
  onPrimaryFixedVariant: darkenColor(_primary, 0.30),

  // Secondary (black, so containers come from the base scale instead)
  secondary: _secondary,
  onSecondary: _secondaryContent,
  secondaryContainer: _base300,
  onSecondaryContainer: _baseContent,
  secondaryFixed: mixColor(_secondary, Colors.white, 0.10),
  secondaryFixedDim: mixColor(_secondary, Colors.white, 0.25),
  onSecondaryFixed: _secondaryContent,
  onSecondaryFixedVariant: _secondary,

  // Tertiary ← DaisyUI accent
  tertiary: _accent,
  onTertiary: _accentContent,
  tertiaryContainer: _tertiaryContainer,
  onTertiaryContainer: lightenColor(_accent, 0.15),
  tertiaryFixed: mixColor(_accent, Colors.white, 0.35),
  tertiaryFixedDim: mixColor(_accent, Colors.white, 0.60),
  onTertiaryFixed: _accentContent,
  onTertiaryFixedVariant: darkenColor(_accent, 0.30),

  // Error
  error: _error,
  onError: _errorContent,
  errorContainer: _errorContainer,
  onErrorContainer: lightenColor(_error, 0.15),

  // Surface ← base-100/200/300
  surface: _base100,
  onSurface: _baseContent,
  onSurfaceVariant: mixColor(_baseContent, _base100, 0.70),
  surfaceDim: _base100,
  surfaceBright: _surfaceHighest,
  surfaceContainerLowest: _base100,
  surfaceContainerLow: _base100,
  surfaceContainer: _base200,
  surfaceContainerHigh: _base300,
  surfaceContainerHighest: _surfaceHighest,
  surfaceTint: _primary,

  // Outline
  outline: mixColor(_baseContent, _base100, 0.40),
  outlineVariant: _base300,

  // Inverse ← DaisyUI neutral
  inverseSurface: _neutral,
  onInverseSurface: _neutralContent,
  inversePrimary: darkenColor(_primary, 0.20),

  // Other
  shadow: Colors.black,
  scrim: Colors.black,
);

const corporateDarkStatus = StatusColors(
  info: _info,
  onInfo: _infoContent,
  success: _success,
  onSuccess: _successContent,
  warning: _warning,
  onWarning: _warningContent,
);

final corporateDarkTheme = buildCorporateTheme(
  scheme: corporateDarkColorScheme,
  status: corporateDarkStatus,
  border: _base300,
  radiusSelector: 4, // 0.25rem
  radiusField: 32, // 2rem
  radiusBox: 16, // 1rem
  depth: 1,
);
