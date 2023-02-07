import 'package:flutter/material.dart';
import 'package:raven_widgets/raven_widgets.dart';
import 'package:raven_widgets/src/widgets/raven_button_loader.dart';

enum ButtonIconPosition { left, right }

class RavenButton extends StatelessWidget {
  const RavenButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    this.textColor = Colors.white,
    this.busy = false,
    this.buttonColor,
    this.enabled = true,
    this.fontSize,
    this.fontWeight,
    this.showIcon = false,
    this.borderColor,
    this.buttonTextStyle,
    this.borderRadius = 8,
    this.buttonIconPosition = ButtonIconPosition.right,
    this.icon,
  }) : super(key: key);
  final String buttonText;
  final void Function() onPressed;
  final Widget? icon;
  final bool busy;
  final Color? buttonColor;
  final Color textColor;
  final bool enabled;
  final double? fontSize;
  final FontWeight? fontWeight;
  final bool showIcon;
  final double borderRadius;
  final TextStyle? buttonTextStyle;
  final ButtonIconPosition buttonIconPosition;
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
      if (showIcon)
        if (icon != null) ...[
          const Gap(8),
          icon!
        ] else ...[
          const Gap(8),
          defaultIcon()
        ]
    ];

    return Material(
      borderRadius: BorderRadius.circular(borderRadius),
      color: enabled
          ? (buttonColor ?? RavenColors.ravenPrimaryGreen)
          : RavenColors.ravenPrimaryGreen.withOpacity(.4),
      child: InkWell(
        onTap: enabled ? onPressed : null,
        child: Container(
          decoration: BoxDecoration(
            border: borderColor == null
                ? null
                : Border.all(color: borderColor!, width: 1),
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
                    children: buttonIconPosition == ButtonIconPosition.right
                        ? rowChildren as List<Widget>
                        : rowChildren.reversed.toList() as List<Widget>,
                  ),
          ),
        ),
      ),
    );
  }

  Widget defaultIcon() => Icon(
        Icons.east,
        color: RavenColors.ravenWhite,
        size: 20,
      );
}
