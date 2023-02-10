import 'package:flutter/material.dart';

class RavenLinearProgressIndicator extends StatelessWidget {
  const RavenLinearProgressIndicator({
    Key? key,
    this.height = 12,
    this.bgColor = const Color(0xFF807E7E),
    this.progress = 0,
    this.progressColor = const Color(0xFF0B8376),
    this.radius = 16,
  }) : super(key: key);
  final double height;
  final Color bgColor;
  final Color progressColor;
  final double progress;
  final double radius;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: height,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: progress / 100,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 1),
          decoration: BoxDecoration(
            color: progressColor,
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
      ),
    );
  }
}
