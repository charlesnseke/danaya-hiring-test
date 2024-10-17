import 'package:flutter/material.dart';

enum KaStyleShadowPosition {
  topLeft,
  top,
  topRight,
  centerLeft,
  center,
  centerRight,
  bottomLeft,
  bottom,
  bottomRight
}

class KaShadow {
  late int alpha;
  late double elevation, spreadRadius, blurRadius;
  Offset? offset;
  KaStyleShadowPosition? position;
  Color? color;
  bool darkShadow;

  KaShadow({
    this.elevation = 8,
    double? spreadRadius,
    double? blurRadius,
    this.offset,
    this.position = KaStyleShadowPosition.bottom,
    int? alpha,
    this.color,
    this.darkShadow = false,
  }) {
    this.spreadRadius = spreadRadius ?? elevation * 0.125;
    this.blurRadius = blurRadius ?? elevation * 2;
    this.alpha = alpha ?? (darkShadow ? 100 : 36);

    if (offset == null) {
      switch (position) {
        case KaStyleShadowPosition.topLeft:
          offset = Offset(-elevation, -elevation);
          break;
        case KaStyleShadowPosition.top:
          offset = Offset(0, -elevation);
          break;
        case KaStyleShadowPosition.topRight:
          offset = Offset(elevation, -elevation);
          break;
        //TODO: Shadow problem
        case KaStyleShadowPosition.centerLeft:
          offset = Offset(-elevation, elevation * 0.25);
          break;
        case KaStyleShadowPosition.center:
          offset = const Offset(0, 0);
          break;
        //TODO: Shadow problem
        case KaStyleShadowPosition.centerRight:
          offset = Offset(elevation, elevation * 0.25);
          break;
        case KaStyleShadowPosition.bottomLeft:
          offset = Offset(-elevation, elevation);
          break;
        case KaStyleShadowPosition.bottom:
          offset = Offset(0, elevation);
          break;
        case KaStyleShadowPosition.bottomRight:
          offset = Offset(elevation, elevation);
          break;
        default:
          offset = Offset(0, elevation);
          break;
      }
    }
  }

  KaShadow.none({
    this.elevation = 0,
    double? spreadRadius,
    double? blurRadius,
    this.offset,
    this.position = KaStyleShadowPosition.bottom,
    int? alpha,
    this.color,
    this.darkShadow = false,
  }) {
    this.spreadRadius = spreadRadius ?? elevation * 0.125;
    this.blurRadius = blurRadius ?? elevation * 2;
    this.alpha = alpha ?? (darkShadow ? 100 : 36);

    if (offset == null) {
      switch (position) {
        case KaStyleShadowPosition.topLeft:
          offset = Offset(-elevation, -elevation);
          break;
        case KaStyleShadowPosition.top:
          offset = Offset(0, -elevation);
          break;
        case KaStyleShadowPosition.topRight:
          offset = Offset(elevation, -elevation);
          break;
        //TODO: Shadow problem
        case KaStyleShadowPosition.centerLeft:
          offset = Offset(-elevation, elevation * 0.25);
          break;
        case KaStyleShadowPosition.center:
          offset = const Offset(0, 0);
          break;
        //TODO: Shadow problem
        case KaStyleShadowPosition.centerRight:
          offset = Offset(elevation, elevation * 0.25);
          break;
        case KaStyleShadowPosition.bottomLeft:
          offset = Offset(-elevation, elevation);
          break;
        case KaStyleShadowPosition.bottom:
          offset = Offset(0, elevation);
          break;
        case KaStyleShadowPosition.bottomRight:
          offset = Offset(elevation, elevation);
          break;
        default:
          offset = Offset(0, elevation);
          break;
      }
    }
  }

  @override
  String toString() {
    return 'KaShadow{alpha: $alpha, elevation: $elevation, spreadRadius: $spreadRadius, blurRadius: $blurRadius, offset: $offset, position: $position, color: $color, darkShadow: $darkShadow}';
  }
}
