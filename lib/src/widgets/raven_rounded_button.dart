import 'package:flutter/material.dart';

class RavenRoundedButton extends StatelessWidget {
  const RavenRoundedButton({
    Key? key,
    required this.onPressed,
    this.buttonColor = const Color(0xff0B8376),
    this.iconSize,
    required this.icon,
    this.height = 50,
    this.width = 50,
  }) : super(key: key);

  final void Function() onPressed;
  final Widget icon;
  final double? iconSize;
  final Color buttonColor;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Material(
        color: buttonColor,
        borderRadius: BorderRadius.circular(200),
        child: InkWell(
            borderRadius: BorderRadius.circular(200),
            onTap: onPressed,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              height: height,
              width: width,
              child: Center(
                child: icon,
              ),
            )));
  }
}
