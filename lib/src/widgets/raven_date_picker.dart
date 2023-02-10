import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:raven_widgets/src/themes/colors/raven_colors.dart';

class RavenDatePicker extends StatefulWidget {
  const RavenDatePicker(
      {Key? key,
      required this.initialDate,
      required this.maxDate,
      required this.minDate,
      required this.onDateTimeChanged,
      required this.showControls,
      this.hideTime = true,
      required this.onConfirmed})
      : super(key: key);

  final DateTime initialDate;
  final DateTime maxDate;
  final DateTime minDate;
  final void Function(DateTime) onDateTimeChanged;
  final void Function(DateTime) onConfirmed;
  final bool hideTime;

  final bool showControls;

  @override
  State<RavenDatePicker> createState() => _RavendatePickerState();
}

class _RavendatePickerState extends State<RavenDatePicker> {
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialDate;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.showControls)
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Cancel',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    )),
                TextButton(
                    onPressed: () {
                      widget.onConfirmed(selectedDate ?? DateTime.now());
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Done',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: RavenColors.ravenPrimaryGreen),
                    )),
              ])
            else
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.close))
                ],
              ),
            Expanded(
              child: CupertinoDatePicker(
                initialDateTime: widget.initialDate,
                maximumDate: widget.maxDate,
                minimumDate: widget.minDate,
                mode: widget.hideTime
                    ? CupertinoDatePickerMode.date
                    : CupertinoDatePickerMode.dateAndTime,
                onDateTimeChanged: (date) {
                  selectedDate = date;
                  if (widget.showControls) {
                    return;
                  }
                  widget.onDateTimeChanged(date);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
