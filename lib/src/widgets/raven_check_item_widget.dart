import 'package:flutter/material.dart';
import 'package:raven_widgets/src/themes/colors/raven_colors.dart';
import 'package:raven_widgets/src/themes/text_styles.dart';

class CheckItemWidget extends StatelessWidget {
  final String title;
  final bool active;
  final Function() onClick;

  const CheckItemWidget(
      {Key? key,
      required this.title,
      this.active = false,
      required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: (!active)
                ? RavenColors.ravenGrey4.withOpacity(0.8)
                : RavenColors.ravenShadeOfGreen30.withOpacity(.5),
            border: (!active)
                ? null
                : Border.all(width: 0.1, color: RavenColors.ravenPrimaryGreen),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12),
            child: Row(
              children: [
                Icon(
                  (!active) ? Icons.check_box_outline_blank : Icons.check_box,
                  color: (!active)
                      ? RavenColors.colorText.withOpacity(0.4)
                      : RavenColors.colorLimeGreen,
                  size: 18,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  title,
                  style: bodyText1,
                ),
              ],
            ),
          )),
    );
  }
}
