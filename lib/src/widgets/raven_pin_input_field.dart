import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:raven_widgets/raven_widgets.dart';

class RavenPinWidget extends StatelessWidget {
  const RavenPinWidget({
    Key? key,
    required this.pinController,
    required this.onSubmit,
    required this.onChanged,
    required this.onComplete,
    this.pinLength = 6,
    this.height = 40,
    this.width = 40,
    this.autoFocus = true,
    this.useNativeKeypad = true,
  }) : super(key: key);

  final TextEditingController pinController;
  final void Function(String) onSubmit;
  final void Function(String) onChanged;
  final Function(String?) onComplete;
  final bool useNativeKeypad;
  final bool autoFocus;
  final double height;
  final double width;
  final int pinLength;

  @override
  Widget build(BuildContext context) {
    return Pinput(
      obscureText: true,
      submittedPinTheme: PinTheme(
        height: height,
        width: width,
        decoration: BoxDecoration(
          border: Border.all(color: RavenColors.ravenGrey4.withOpacity(.3)),
          color: const Color(0xffF9F9F9),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      focusedPinTheme: PinTheme(
        height: height,
        width: width,
        decoration: BoxDecoration(
          border: Border.all(color: RavenColors.ravenGrey4.withOpacity(.3)),
          color: const Color(0xffF9F9F9),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      followingPinTheme: PinTheme(
          height: height,
          width: width,
          decoration: BoxDecoration(
            border: Border.all(color: RavenColors.ravenGrey4.withOpacity(.1)),
            color: const Color(0xffF9F9F9),
            borderRadius: BorderRadius.circular(8),
          )),
      disabledPinTheme: PinTheme(
        height: height,
        width: width,
        decoration: BoxDecoration(
          border: Border.all(color: RavenColors.ravenGrey4.withOpacity(.3)),
          color: const Color(0xffF9F9F9),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      onCompleted: onComplete,
      obscuringCharacter: '◉',
      useNativeKeyboard: useNativeKeypad,
      onChanged: onChanged,
      // onEditingComplete: onComplete,
      defaultPinTheme: PinTheme(
          textStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: RavenColors.ravenColorText),
          height: height,
          width: width,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          margin: const EdgeInsets.fromLTRB(0, 8, 0, 8)),
      onSubmitted: onSubmit,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      length: pinLength,

      controller: pinController,

      autofocus: autoFocus,
      // fieldsAlignment: MainAxisAlignmentaceBetween,

      // inputDecoration: const InputDecoration(
      //   counterText: '',
      //   focusedBorder: InputBorder.none,
      //   enabledBorder: InputBorder.none,
      // ),
    );
  }
}
