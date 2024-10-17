import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

enum Breakpoint {
  xs,
  sm,
  md,
  lg,
  xl,
  xxl;

  bool operator <=(Breakpoint other) => index <= other.index;
  bool operator <(Breakpoint other) => index < other.index;
  bool operator >(Breakpoint other) => index > other.index;
  bool operator >=(Breakpoint other) => index >= other.index;
}

const breakpoints = (
  xs: 480.0,
  sm: 640.0,
  md: 820.0,
  lg: 1024.0,
  xl: 1280.0,
);

extension SliverBreakpoints on SliverConstraints {
  bool get isXs => crossAxisExtent <= breakpoints.xs;
  bool get isSm =>
      crossAxisExtent > breakpoints.xs && crossAxisExtent <= breakpoints.sm;
  bool get isMd =>
      crossAxisExtent > breakpoints.sm && crossAxisExtent <= breakpoints.md;
  bool get isLg =>
      crossAxisExtent > breakpoints.md && crossAxisExtent <= breakpoints.lg;
  bool get isXl =>
      crossAxisExtent > breakpoints.lg && crossAxisExtent <= breakpoints.xl;
  bool get is2Xl => crossAxisExtent > breakpoints.xl;

  Breakpoint get breakpoint {
    if (isXs) return Breakpoint.xs;
    if (isSm) return Breakpoint.sm;
    if (isMd) return Breakpoint.md;
    if (isLg) return Breakpoint.lg;
    if (isXl) return Breakpoint.xl;
    return Breakpoint.xxl;
  }

  bool get smAndUp => isSm || isMd || isLg || isXl || is2Xl;
  bool get mdAndUp => isMd || isLg || isXl || is2Xl;
  bool get lgAndUp => isLg || isXl || is2Xl;
  bool get xlAndUp => isXl || is2Xl;

  bool get smAndDown => isXs || isSm;
  bool get mdAndDown => isXs || isSm || isMd;
  bool get lgAndDown => isXs || isSm || isMd || isLg;
  bool get xlAndDown => isXs || isSm || isMd || isLg || isXl;
}

extension ContainerBreakpoints on BoxConstraints {
  bool get isXs => biggest.width <= breakpoints.xs;
  bool get isSm =>
      biggest.width > breakpoints.xs && biggest.width <= breakpoints.sm;
  bool get isMd =>
      biggest.width > breakpoints.sm && biggest.width <= breakpoints.md;
  bool get isLg =>
      biggest.width > breakpoints.md && biggest.width <= breakpoints.lg;
  bool get isXl =>
      biggest.width > breakpoints.lg && biggest.width <= breakpoints.xl;
  bool get is2Xl => biggest.width > breakpoints.xl;

  Breakpoint get breakpoint {
    if (isXs) return Breakpoint.xs;
    if (isSm) return Breakpoint.sm;
    if (isMd) return Breakpoint.md;
    if (isLg) return Breakpoint.lg;
    if (isXl) return Breakpoint.xl;
    return Breakpoint.xxl;
  }

  bool get smAndUp => isSm || isMd || isLg || isXl || is2Xl;
  bool get mdAndUp => isMd || isLg || isXl || is2Xl;
  bool get lgAndUp => isLg || isXl || is2Xl;
  bool get xlAndUp => isXl || is2Xl;

  bool get smAndDown => isXs || isSm;
  bool get mdAndDown => isXs || isSm || isMd;
  bool get lgAndDown => isXs || isSm || isMd || isLg;
  bool get xlAndDown => isXs || isSm || isMd || isLg || isXl;
}

extension ScreenBreakpoints on MediaQueryData {
  bool get isXs => size.width <= breakpoints.xs;
  bool get isSm => size.width > breakpoints.xs && size.width <= breakpoints.md;
  bool get isMd => size.width > breakpoints.sm && size.width <= breakpoints.md;
  bool get isLg => size.width > breakpoints.md && size.width <= breakpoints.lg;
  bool get isXl => size.width > breakpoints.lg && size.width <= breakpoints.xl;
  bool get is2Xl => size.width > breakpoints.xl;

  
  bool get smAndUp => isSm || isMd || isLg || isXl || is2Xl;
  bool get mdAndUp => isMd || isLg || isXl || is2Xl;
  bool get lgAndUp => isLg || isXl || is2Xl;
  bool get xlAndUp => isXl || is2Xl;

  bool get smAndDown => isXs || isSm;
  bool get mdAndDown => isXs || isSm || isMd;
  bool get lgAndDown => isXs || isSm || isMd || isLg;
  bool get xlAndDown => isXs || isSm || isMd || isLg || isXl;

}
