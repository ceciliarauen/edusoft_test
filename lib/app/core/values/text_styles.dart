import 'package:edusoft/app/core/values/design_system_colors.dart';
import 'package:edusoft/app/core/values/fonts.dart';
import 'package:flutter/material.dart';

class TextStyles {
  static const TextStyle semiBold16White = TextStyle(
    fontWeight: Fonts.semiBoldWeight,
    fontSize: Fonts.fontSizeLarge,
    color: DesignSystemColors.textWhite,
    letterSpacing: 0.7,
  );
  static const TextStyle medium18Black = TextStyle(
    fontWeight: Fonts.mediumWeight,
    fontSize: 24,
    color: Colors.black,
    letterSpacing: 0.7,
  );
}
