// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:raven_widgets/src/themes/colors/raven_colors.dart';
import 'package:raven_widgets/src/themes/text_styles.dart';

class RavenPinPadWidget extends StatefulWidget {
  const RavenPinPadWidget({
    Key? key,
    required this.onChanged,
    this.maxDigitsAllowed = 6,
    required this.onDeviceAuthButtonPressed,
  }) : super(key: key);
  final void Function() onDeviceAuthButtonPressed;
  final void Function(String) onChanged;
  final int maxDigitsAllowed;

  @override
  _RavenPinPadWidgetState createState() => _RavenPinPadWidgetState();
}

class _RavenPinPadWidgetState extends State<RavenPinPadWidget> {
  String _allInputs = '';
  late List<PinPadItem> _pinPadItems;

  void updateInput(String value) {
    /// Keypad should not allow more that the max digits specified
    if (_allInputs.length == widget.maxDigitsAllowed) {
      widget.onChanged(_allInputs);
    } else {
      _allInputs = _allInputs + value;
      widget.onChanged(_allInputs);
    }
  }

  void clearLastChar() {
    if (_allInputs.isNotEmpty) {
      final chars = _allInputs.split('')..removeLast();
      _allInputs = chars.join();
      widget.onChanged(_allInputs);
    }
  }

  @override
  void initState() {
    super.initState();
    _pinPadItems = <PinPadItem>[
      PinPadItem(
        child: Text(
          '1',
          style: getDigitsStyle(),
        ),
        onTap: () {
          updateInput('1');
        },
      ),
      PinPadItem(
        child: Text(
          '2',
          style: getDigitsStyle(),
        ),
        onTap: () {
          updateInput('2');
        },
      ),
      PinPadItem(
        child: Text(
          '3',
          style: getDigitsStyle(),
        ),
        onTap: () {
          updateInput('3');
        },
      ),
      PinPadItem(
        child: Text(
          '4',
          style: getDigitsStyle(),
        ),
        onTap: () {
          updateInput('4');
        },
      ),
      PinPadItem(
        child: Text(
          '5',
          style: getDigitsStyle(),
        ),
        onTap: () {
          updateInput('5');
        },
      ),
      PinPadItem(
        child: Text(
          '6',
          style: getDigitsStyle(),
        ),
        onTap: () {
          updateInput('6');
        },
      ),
      PinPadItem(
        child: Text(
          '7',
          style: getDigitsStyle(),
        ),
        onTap: () {
          updateInput('7');
        },
      ),
      PinPadItem(
        child: Text(
          '8',
          style: getDigitsStyle(),
        ),
        onTap: () {
          updateInput('8');
        },
      ),
      PinPadItem(
        child: Text(
          '9',
          style: getDigitsStyle(),
        ),
        onTap: () {
          updateInput('9');
        },
      ),
      PinPadItem(
        bgColor: RavenColors.ravenPrimaryGreen,
        child: SizedBox(
          width: 24,
          height: 24,
          child: SvgPicture.asset('assets/svg/finger_print_icon.svg'),
        ),
        onTap: widget.onDeviceAuthButtonPressed,
      ),
      PinPadItem(
        child: Text(
          '0',
          style: getDigitsStyle(),
        ),
        onTap: () {
          updateInput('0');
        },
      ),
      PinPadItem(
        child: Icon(
          Icons.backspace_outlined,
          size: 22,
          color: RavenColors.ravenPrimaryGreen2,
        ),
        onTap: clearLastChar,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      childAspectRatio: 1.3,
      crossAxisSpacing: 1,
      mainAxisSpacing: 10,
      children: _pinPadItems
          .map(
            (p) => GestureDetector(
              onTap: p.onTap,
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: p.bgColor),
                child: Center(child: p.child),
              ),
            ),
          )
          .toList(),
    );
  }

  TextStyle getDigitsStyle() => headling1.copyWith(
        fontWeight: FontWeight.w800,
        fontSize: 30,
        color: RavenColors.ravenPrimaryGreen2,
      );
}

class PinPadItem {
  PinPadItem({
    required this.child,
    required this.onTap,
    this.bgColor = const Color(0xffF9F9F9),
  });

  final Widget child;
  final void Function() onTap;
  final Color bgColor;
}
