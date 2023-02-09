import 'package:flutter/material.dart';
import 'package:raven_widgets/src/themes/colors/raven_colors.dart';

Future<T?> showRavenBottomSheet<T>(
  BuildContext context, {
  required Widget child,
  bool isScrollControlled = true,
  bool isDissmissible = true,
  bool enableDrag = true,
}) async {
  return showModalBottomSheet<T>(
    enableDrag: enableDrag,
    isDismissible: isDissmissible,
    isScrollControlled: isScrollControlled,
    context: context,
    builder: (_) {
      return child;
    },
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
          top: Radius.circular(20), bottom: Radius.circular(0)),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
  );
}

class RavenBottomSheetCapsule extends StatelessWidget {
  const RavenBottomSheetCapsule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 5,
          width: 40,
          decoration: BoxDecoration(
            color: RavenColors.ravenGrey4.withOpacity(.5),
            borderRadius: BorderRadius.circular(4),
          ),
        )
      ],
    );
  }
}
