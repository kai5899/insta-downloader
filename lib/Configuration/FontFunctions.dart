import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:instagram_media_downloader/Configuration/Pallete.dart';

TextStyle ptSansStyle({Color textColor, double textSize, FontWeight weight}) {
  return GoogleFonts.ptSans(
      color: textColor ?? black,
      fontSize: textSize ?? 18,
      fontWeight: weight ?? null);
}

// TextStyle montserratStyle(
//     {double fontSize,
//     TextDecoration textDecoration,
//     Color color,
//     FontWeight fontWeight}) {
//   return GoogleFonts.montserrat(
//       fontSize: fontSize,
//       color: color,
//       fontWeight: fontWeight != null ? fontWeight : null,
//       decoration: textDecoration);
// }

TextStyle chilankaStyle(
    {double fontSize,
    TextDecoration textDecoration,
    Color color,
    FontWeight fontWeight}) {
  return GoogleFonts.chilanka(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight != null ? fontWeight : null,
      decoration: textDecoration);
}
