
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildText extends StatelessWidget {
  late String text;
  double size;
  Color? color;
  bool? bold;
  bool? center;
  int? maxLines;
  bool? overflow;

  BuildText({required this.text, this.color, this.size = 18, this.bold,this.center,this.maxLines,this.overflow});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow != null? TextOverflow.ellipsis: null,
      style: GoogleFonts.notoSansArabic(
        color: color == null? Colors.black : color,
        fontSize: size,
        fontWeight: bold != null ? FontWeight.bold : null,
      ),
      textAlign: center == null? null: TextAlign.center,
      maxLines: maxLines == null? null : maxLines,
    );
  }
}
