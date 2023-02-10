import 'package:flutter/material.dart';
import 'package:raven_widgets/src/helpers/helper_method.dart';
import 'package:raven_widgets/src/themes/text_styles.dart';

class RavenRichText extends StatelessWidget {
  const RavenRichText({
    Key? key,
    required this.amount,
    this.fontWeight = FontWeight.w800,
    this.fontSize = 24,
    this.color = const Color(0xff0B8376),
    this.textAlign = TextAlign.center,
    this.prefixText = '',
    this.suffixText = '',
    this.floorAmount = false,
    this.currencySymbol = '₦',
    this.maskText = false,
  }) : super(key: key);

  final double amount;
  final double fontSize;
  final FontWeight? fontWeight;
  final Color color;
  final TextAlign textAlign;
  final String? prefixText;
  final String? suffixText;
  final bool? floorAmount;
  final bool maskText;
  final String currencySymbol;

  @override
  Widget build(BuildContext context) {
    bool toFloor = false;
    if (floorAmount != null) {
      toFloor = floorAmount!;
    }

    return RichText(
      textAlign: textAlign,
      textScaleFactor: MediaQuery.of(context).textScaleFactor,
      text: TextSpan(
        text: prefixText ?? '',
        style: bodyText1.copyWith(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight ?? FontWeight.w800),
        children: maskText
            ? [
                TextSpan(
                    text: '********',
                    style: bodyText1.copyWith(
                        color: color,
                        fontSize: fontSize,
                        fontWeight: fontWeight ?? FontWeight.w800)),
              ]
            : <TextSpan>[
                TextSpan(
                    text: currencySymbol,
                    style: TextStyle(
                        color: color,
                        fontSize: (fontSize - 3),
                        fontFamily: 'Base-Regular',
                        fontWeight: fontWeight ?? FontWeight.w800)),
                TextSpan(
                    text: (!toFloor)
                        ? RavenHelperMethod.currencyNoSymbol2(amount)
                        : RavenHelperMethod.currencyNoSymbol(amount),
                    style: bodyText1.copyWith(
                        color: color,
                        fontSize: fontSize,
                        fontWeight: fontWeight ?? FontWeight.w800)),
                TextSpan(
                    text: suffixText ?? '',
                    style: bodyText1.copyWith(
                        color: color,
                        fontSize: fontSize,
                        fontWeight: fontWeight ?? FontWeight.w800)),
              ],
      ),
    );
  }
}
