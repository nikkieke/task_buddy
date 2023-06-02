import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText extends StatelessWidget{
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final TextDecoration? line;
  final double? size;
  final String? fontFamily;
  final TextAlign? textAlign;
  final double? letterSpacing;
  final TextOverflow? overFLow;
  final double? height;
  final int? maxLines;
  const AppText(
      {Key? key,
        this.color,
        this.fontWeight,
        required this.text,
        this.size,
        this.line,
        this.fontFamily,
        this.textAlign,
        this.letterSpacing,
        this.overFLow,
        this.maxLines,
        this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overFLow,
      maxLines: maxLines,
      style: TextStyle(
        letterSpacing: letterSpacing,
        fontSize: size,
        fontWeight: fontWeight,
        color: color,
        height: height ?? 1,
        fontFamily: fontFamily ?? GoogleFonts.roboto().fontFamily,
        decoration: line,
      ),
    );
  }
}