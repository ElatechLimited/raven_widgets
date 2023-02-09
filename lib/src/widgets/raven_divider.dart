import 'package:flutter/material.dart';

class RavenDivider extends StatelessWidget {
  final Color thisColor;

  const RavenDivider({Key? key, this.thisColor = const Color(0xFFe2e2e2)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1.0,
      color: thisColor,
      thickness: 1.0,
    );
  }
}
