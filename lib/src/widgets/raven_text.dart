import 'package:flutter/material.dart';
import 'package:raven_widgets/src/themes/text_styles.dart';

class RavenText extends StatelessWidget {
  final String text;
  final TextStyle style;
  RavenText.headingOne(this.text, {super.key, Color? color, double? fontSize})
      : style = headling1.copyWith(fontSize: fontSize, color: color);
  RavenText.headingTwo(this.text, {super.key, Color? color, double? fontSize})
      : style = headling2.copyWith(fontSize: fontSize, color: color);
  RavenText.bodyText1(this.text,
      {super.key, Color? color, double? fontSize, FontWeight? fontWeight})
      : style = bodyText1.copyWith(
            fontSize: fontSize, color: color, fontWeight: fontWeight);
  RavenText.bodyText2(this.text,
      {super.key, Color? color, double? fontSize, FontWeight? fontWeight})
      : style = bodyText2.copyWith(
            fontSize: fontSize, color: color, fontWeight: fontWeight);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: style);
  }
}
