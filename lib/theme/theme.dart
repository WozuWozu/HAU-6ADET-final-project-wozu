import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Spacing constants — Step C of the design system.
/// Base unit 4. Screen edge padding = md. List-item gap = sm.
/// Section gap = lg.
class AppSpacing {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
}

/// Colors pulled directly from the mockup: #F5F5F5 · #0F2934 · #1F637B.
/// Everything else is generated from the seed so contrast stays safe.
/// (Design system Step A.)
final ColorScheme _lightScheme = ColorScheme.fromSeed(
  seedColor: const Color(0xFF1F637B), // primary — header bars, splash fill
  brightness: Brightness.light,
).copyWith(
  surface: const Color(0xFFF5F5F5), // exact screen background
  onSurface: const Color(0xFF0F2934), // exact ink color
  secondaryContainer: const Color(0xFFE3EEF1), // tag chip fill, e.g. "Stoicism"
);

/// Type scale — Step B. Three families: Poppins (headings), Work Sans
/// (reading copy), Raleway (uppercase eyebrow labels/tags).
final TextTheme _textTheme = TextTheme(
  headlineSmall: GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  ),
  bodyMedium: GoogleFonts.workSans(
    fontSize: 15,
    fontWeight: FontWeight.normal,
    height: 1.5,
  ),
  labelSmall: GoogleFonts.raleway(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.6,
  ),
);

/// Light-only theme. Decided deliberately in the design system: the mockup
/// is a single light theme across all 4 screens, and a second contrast-
/// checked ColorScheme wasn't worth the remaining term time. Every fill in
/// this app pulls from Theme.of(context).colorScheme rather than a literal
/// color, so revisiting dark mode later doesn't mean hunting down
/// hardcoded colors first.
final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  colorScheme: _lightScheme,
  scaffoldBackgroundColor: _lightScheme.surface,
  textTheme: _textTheme,
  appBarTheme: AppBarTheme(
    backgroundColor: _lightScheme.primary,
    foregroundColor: _lightScheme.onPrimary,
    elevation: 0,
    centerTitle: false,
  ),
  cardTheme: CardThemeData(
    margin: const EdgeInsets.all(AppSpacing.sm),
    color: Colors.white, // surfaceContainer — quote card, panels, tiles
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
      side: BorderSide(color: _lightScheme.onSurface.withValues(alpha: 0.08)),
    ),
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
      backgroundColor: _lightScheme.primary,
      foregroundColor: _lightScheme.onPrimary,
      minimumSize: const Size.fromHeight(48),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      textStyle: GoogleFonts.raleway(
        fontWeight: FontWeight.w600,
        letterSpacing: 1.2,
      ),
    ),
  ),
);
