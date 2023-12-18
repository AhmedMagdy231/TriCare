import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tricare/Shared/App%20Color/colors.dart';



class BuildButton extends StatelessWidget {
  Color? colorText;
  Color? color;
  double height;
  double width;
  dynamic function;
  String text;
  double size;
  double radius;


  BuildButton({
    required this.width,
    required  this.height,
    required this.function,
    required  this.text,
    required  this.size,
    this.colorText,
    this.color,
    this.radius=15
  }) ;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: function,
      color: color == null?  AppColor.primaryColor: color,
      minWidth: width,
      height: height,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      child:  Text(
        text,
        style: GoogleFonts.notoSansArabic(
          color: colorText == null?  Colors.white : colorText,
          fontWeight: FontWeight.bold,
          fontSize: size,
        ),
      ),
    );
  }
}