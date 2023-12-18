import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tricare/Shared/App%20Color/colors.dart';



class BuildTextFormField extends StatelessWidget {
  late TextEditingController controller;
  late String hintText;
  late IconData prefixIcon;
  Widget? suffixIcon;
  String? Function(String?)? valid;
  TextInputType? keyboardType;
  bool? isPassword;
  int? maxLength;


  BuildTextFormField({
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    IconButton? this.suffixIcon,
    required String? Function(String?)? this.valid,
    this.keyboardType,
    this.isPassword,
    this.maxLength,


  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength==null? null: maxLength,
      autocorrect: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      style: GoogleFonts.openSans(
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
      validator: valid,
      keyboardType: keyboardType,
      obscureText: isPassword ?? false,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(18),
        errorStyle: GoogleFonts.notoSansArabic(fontWeight: FontWeight.bold),
        hintText: hintText,
        fillColor: Colors.grey.shade200,
        filled: true,
        suffixIcon: suffixIcon,
        prefixIcon: Padding(
          padding: EdgeInsets.only(right: 20, left: 20),
          child: Icon(
            prefixIcon,
            color: AppColor.primaryColor,
          ),
        ),
        hintStyle: GoogleFonts.openSans(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(20),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}

