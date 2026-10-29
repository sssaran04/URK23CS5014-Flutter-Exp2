import 'package:flutter/widgets.dart';

/// Breakpoints and helper methods used across the app.
///
/// mobile  : width < 600
/// tablet  : 600 <= width <= 1024
/// desktop : width > 1024
class Responsive {
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 1024;

  // MediaQuery: reads the current screen width.
  static double width(BuildContext context) => MediaQuery.sizeOf(context).width;

  static bool isMobile(BuildContext context) =>
      width(context) < mobileBreakpoint;

  static bool isTablet(BuildContext context) =>
      width(context) >= mobileBreakpoint && width(context) <= tabletBreakpoint;

  static bool isDesktop(BuildContext context) =>
      width(context) > tabletBreakpoint;

  /// Grid column count for a given screen width: 2 / 3 / 4.
  static int gridColumns(double width) {
    if (width < mobileBreakpoint) return 2;
    if (width <= tabletBreakpoint) return 3;
    return 4;
  }

  /// Returns one of three values depending on the current breakpoint.
  static T value<T>(
    BuildContext context, {
    required T mobile,
    required T tablet,
    required T desktop,
  }) {
    if (isDesktop(context)) return desktop;
    if (isTablet(context)) return tablet;
    return mobile;
  }
}
