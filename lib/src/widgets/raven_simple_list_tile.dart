// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:raven_widgets/src/themes/colors/raven_colors.dart';
import 'package:raven_widgets/src/themes/text_styles.dart';
import 'package:raven_widgets/src/widgets/raven_bottom_sheet.dart';

class RavenSimpleListTile extends StatefulWidget {
  final List<String>? thisList;
  final double? containerHeight;
  final String? title;

  const RavenSimpleListTile(
      {this.thisList,
      this.containerHeight,
      this.title = 'Choose One',
      Key? key})
      : super(key: key);

  @override
  _RavenSimpleListTile createState() => _RavenSimpleListTile();
}

class _RavenSimpleListTile extends State<RavenSimpleListTile> {
  List<Widget> printItem() {
    List<Widget> itemRow = [];
    for (String item in widget.thisList!) {
      StringListTile thisRow = StringListTile(title: item);
      setState(() {
        itemRow.add(thisRow);
      });
    }

    return itemRow;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: widget.containerHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 4,
            ),
            const RavenBottomSheetCapsule(),
            const SizedBox(
              height: 14,
            ),
            Text(
              widget.title!,
              style: bodyText1.copyWith(
                color: RavenColors.ravenPrimaryGreen2,
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: printItem(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StringListTile extends StatelessWidget {
  final String? title;

  const StringListTile({this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context, title);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom:
                  BorderSide(color: RavenColors.ravenGrey5.withOpacity(0.2))),
          //  borderRadius: BorderRadius.circular(4),
          //border: Border.all(width: 0.5, color: BrandColors.colorLightGray),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Text(
                title ?? '',
                style: bodyText1.copyWith(
                    fontSize: 16,
                    color: RavenColors.colorText,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
