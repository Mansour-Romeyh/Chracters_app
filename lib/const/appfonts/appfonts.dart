import 'package:blooc/const/appcolor/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  static TextStyle frist() {
    return GoogleFonts.agbalumo(
        textStyle: TextStyle(
            color: AppColor.frist, fontSize: 20, fontWeight: FontWeight.bold));
  }

  static TextStyle second() {
    return GoogleFonts.agbalumo(
        textStyle: TextStyle(
            color: AppColor.five, fontSize: 20, fontWeight: FontWeight.bold));
  }
}
