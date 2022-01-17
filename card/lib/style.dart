import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DamStyle {
  // Colors
  static const Color colorTextBarato = Color.fromRGBO(0, 255, 109, 2);
  static const Color color45Oferta = Color.fromRGBO(126, 126, 126, 0);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color orangeColor = Color(0xFFE62F16);
  static const Color colorTextMini = Color.fromRGBO(0, 0, 0, 20);
  static const Color colorDescripCitroen = Color.fromRGBO(120, 120, 120, 0.3);
  static const Color colorSeleccionar = Color.fromRGBO(78, 152, 252, 1);

  // Margins, Paddings, Card properties
  static const double bodyPadding = 8.0;

  // Font sizes, TextStyles
  static const double textSizeSmall = 14.0;
  static const double textSizeMedium = 18.0;
  static const double textSizeBig = 20.0;
  static const double textSizeTitle = 40.0;
  static const double textSizeSeleccionar = 20.0;

  static TextStyle get textTitle => GoogleFonts.getFont(
        'Nunito',
        color: DamStyle.orangeColor,
        fontWeight: FontWeight.w600,
        fontSize: 40,
      );

  static TextStyle textTitleCustom(Color c, double fSize) =>
      GoogleFonts.getFont(
        'Nunito',
        color: c,
        fontWeight: FontWeight.w700,
        fontSize: fSize,
      );
}