import 'package:flutter/material.dart';

import 'utils.dart';

// ── Direct DaisyUI values (OKLCH → sRGB) ────────────────────────────
const _base100 = Color(0xFFF7F9FA);
const _base200 = Color(0xFFEEF2F6);
const _base300 = Color(0xFFDFE5ED);
const _baseContent = Color(0xFF0D1529);

const _primary = Color(0xFFF34700);
const _primaryContent = Color(0xFFFFF7ED);
const _secondary = Color(0xFF0082CE);
const _secondaryContent = Color(0xFFEDF7FD);
const _accent = Color(0xFFE50076);
const _accentContent = Color(0xFFFCF2F8);
const _neutral = Color(0xFF1A273A);
const _neutralContent = Color(0xFFF7F9FA);

const _info = Color(0xFF2A7EFF);
const _infoContent = Color(0xFFEFF6FF);
const _success = Color(0xFF00BA7B);
const _successContent = Color(0xFFE9FAF2);
const _warning = Color(0xFFFA9700);
const _warningContent = Color(0xFFFDF9E8);
const _error = Color(0xFFFE1C55);
const _errorContent = Color(0xFFFCEEEF);

// ── Derived container roles (tinted wash over base-100) ─────────────
final _primaryContainer = mixColor(_primary, _base100, 0.15);
final _secondaryContainer = mixColor(_secondary, _base100, 0.15);
final _tertiaryContainer = mixColor(_accent, _base100, 0.15);
final _errorContainer = mixColor(_error, _base100, 0.15);

final corporateLightColorScheme = ColorScheme(
  brightness: Brightness.light,

  // Primary
  primary: _primary,
  onPrimary: _primaryContent,
  primaryContainer: _primaryContainer,
  onPrimaryContainer: darkenColor(_primary, 0.30),
  primaryFixed: _primaryContainer,
  primaryFixedDim: mixColor(_primary, _base100, 0.30),
  onPrimaryFixed: darkenColor(_primary, 0.40),
  onPrimaryFixedVariant: darkenColor(_primary, 0.25),

  // Secondary
  secondary: _secondary,
  onSecondary: _secondaryContent,
  secondaryContainer: _secondaryContainer,
  onSecondaryContainer: darkenColor(_secondary, 0.30),
  secondaryFixed: _secondaryContainer,
  secondaryFixedDim: mixColor(_secondary, _base100, 0.30),
  onSecondaryFixed: darkenColor(_secondary, 0.40),
  onSecondaryFixedVariant: darkenColor(_secondary, 0.25),

  // Tertiary ← DaisyUI accent
  tertiary: _accent,
  onTertiary: _accentContent,
  tertiaryContainer: _tertiaryContainer,
  onTertiaryContainer: darkenColor(_accent, 0.30),
  tertiaryFixed: _tertiaryContainer,
  tertiaryFixedDim: mixColor(_accent, _base100, 0.30),
  onTertiaryFixed: darkenColor(_accent, 0.40),
  onTertiaryFixedVariant: darkenColor(_accent, 0.25),

  // Error
  error: _error,
  onError: _errorContent,
  errorContainer: _errorContainer,
  onErrorContainer: darkenColor(_error, 0.30),

  // Surface ← base-100/200/300
  surface: _base100,
  onSurface: _baseContent,
  onSurfaceVariant: mixColor(_baseContent, _base100, 0.70),
  surfaceDim: _base300,
  surfaceBright: _base100,
  surfaceContainerLowest: _base100,
  surfaceContainerLow: _base100,
  surfaceContainer: _base200,
  surfaceContainerHigh: _base300,
  surfaceContainerHighest: _base300,
  surfaceTint: _primary,

  // Outline
  outline: mixColor(_baseContent, _base100, 0.40),
  outlineVariant: _base300,

  // Inverse ← DaisyUI neutral
  inverseSurface: _neutral,
  onInverseSurface: _neutralContent,
  inversePrimary: mixColor(_primary, _neutralContent, 0.60),

  // Other
  shadow: Colors.black,
  scrim: Colors.black,
);

const corporateLightStatus = StatusColors(
  info: _info,
  onInfo: _infoContent,
  success: _success,
  onSuccess: _successContent,
  warning: _warning,
  onWarning: _warningContent,
);

final corporateLightTheme = buildCorporateTheme(
  scheme: corporateLightColorScheme,
  status: corporateLightStatus,
  border: _base300,
  radiusSelector: 4, // 0.25rem
  radiusField: 16, // 1rem
  radiusBox: 16, // 1rem
  depth: 0,
);
