import 'package:flutter/material.dart';
import 'package:raven_widgets/raven_widgets.dart';
import 'package:raven_widgets/src/widgets/raven_button_loader.dart';

class RavenOutlinedButton extends StatelessWidget {
  const RavenOutlinedButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    this.textColor = const Color(0xff0B8376),
    this.busy = false,
    this.buttonColor = Colors.white,
    this.fontSize,
    this.fontWeight,
    this.borderColor = const Color(0xff0B8376),
    this.buttonTextStyle,
    this.borderRadius = 8,
  }) : super(key: key);
  final String buttonText;
  final void Function() onPressed;

  final bool busy;
  final Color? buttonColor;
  final Color textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double borderRadius;
  final TextStyle? buttonTextStyle;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    final List rowChildren = <Widget>[
      RavenText.bodyText1(
        buttonText,
        color: textColor,
        fontWeight: fontWeight,
      ),

      ///if show icon is through and a custom icon is passed
      ///show that, else show the default button icon
    ];

    return Material(
      color: (buttonColor),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: borderColor!, width: 1),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          height: 50,
          child: Center(
            child: busy
                ? RavenButtonLoader(
                    color: textColor,
                    size: 30,
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: rowChildren as List<Widget>,
                  ),
          ),
        ),
      ),
    );
  }
}
