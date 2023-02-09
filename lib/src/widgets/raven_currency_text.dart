// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:raven_widgets/src/helpers/helper_method.dart';
import 'package:raven_widgets/src/themes/text_styles.dart';

class RavenCurrencyText extends StatelessWidget {
  final String currencyString;
  final double fontSize;
  final double amount;
  final String fontWeight;
  final Color color;

  const RavenCurrencyText(
      {required this.currencyString,
      required this.fontSize,
      required this.amount,
      required this.fontWeight,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textScaleFactor: MediaQuery.of(context).textScaleFactor,
      text: TextSpan(
        text: currencyString,
        style: TextStyle(
            fontFamily:
                (fontWeight == 'regular') ? 'Base-Regular' : 'Base-Bold',
            color: color,
            fontSize: fontSize),
        children: <TextSpan>[
          TextSpan(
            text: RavenHelperMethod.currencyNoSymbol(amount),
            style: bodyText1.copyWith(
              fontWeight:
                  (fontWeight == 'bold') ? FontWeight.w800 : FontWeight.w400,
              fontSize: fontSize,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
