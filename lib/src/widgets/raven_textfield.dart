// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:raven_widgets/raven_widgets.dart';
import 'package:raven_widgets/src/themes/text_styles.dart';

class RavenTextField extends StatefulWidget {
  const RavenTextField({
    Key? key,
    required this.controller,
    this.enabled = true,
    this.autoFocus = false,
    this.inputType = TextInputType.name,
    this.autofillHints,
    this.inputAction = TextInputAction.done,
    this.focusNode,
    this.maxLength,
    this.maxLines,
    this.minLines,
    this.labelText = '',
    this.suffixIcon,
    this.validator,
    this.onTap,
    this.contentPadding =
        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    this.inputFormatters,
    this.onChanged,
    this.readOnly = false,
    this.isRequiredField = false,
    this.onSaved,
    this.isPasswordField = false,
    this.obscure = false,
    this.hintText = '',
    this.showLeadingSpace = true,
    this.textCapitalization = TextCapitalization.none,
    this.counterText,
  }) : super(key: key);
  final TextEditingController controller;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final TextCapitalization textCapitalization;
  final FocusNode? focusNode;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;

  final bool enabled;
  final bool? autoFocus;
  final EdgeInsets contentPadding;
  final List<String>? autofillHints;
  final bool obscure;
  final List<TextInputFormatter>? inputFormatters;
  final String labelText;
  final String hintText;
  final Widget? suffixIcon;
  final void Function()? onTap;
  final bool readOnly;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onSaved;
  final bool isRequiredField;
  final bool isPasswordField;
  final String? counterText;
  final bool showLeadingSpace;

  @override
  _RavenTextFieldState createState() => _RavenTextFieldState();
}

class _RavenTextFieldState extends State<RavenTextField> {
  late bool obscure;

  @override
  void initState() {
    super.initState();
    obscure = widget.obscure;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              widget.labelText,
              style: bodyText1.copyWith(
                  fontSize: 14,
                  color: Colors.black87.withOpacity(0.6),
                  fontWeight: FontWeight.w500),
            ),
            if (widget.isRequiredField) ...[
              const Gap(
                2,
              ),
            ]
          ],
        ),
        const SizedBox(
          height: 6,
        ),
        TextFormField(
          validator: widget.validator,
          onChanged: widget.onChanged,
          readOnly: widget.readOnly,
          onTap: widget.onTap,
          minLines: widget.minLines,
          inputFormatters: widget.inputFormatters,
          style: bodyText1.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: RavenColors.ravenPrimaryGreen,
          ),
          obscureText: obscure,
          keyboardType: widget.inputType,
          enabled: widget.enabled,
          maxLength: widget.maxLength,
          maxLines: widget.isPasswordField ? 1 : widget.maxLines,
          controller: widget.controller,
          textInputAction: widget.inputAction,
          textCapitalization: widget.textCapitalization,
          decoration: InputDecoration(
            contentPadding: widget.contentPadding,
            counterText: widget.counterText,
            suffixIcon: widget.suffixIcon ?? getSuffixIcon(),
            suffixIconConstraints: const BoxConstraints(
              minWidth: 40,
              minHeight: 40,
              maxHeight: 50,
              maxWidth: 50,
            ),
            fillColor: const Color(0xffF9F9F9),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            hintStyle: bodyText1.copyWith(
              color: RavenColors.ravenGrey3,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
            hintText: widget.isPasswordField ? '*********' : widget.hintText,
            errorStyle: const TextStyle(color: Colors.red),
            counterStyle: bodyText1.copyWith(fontWeight: FontWeight.w600),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide:
                  BorderSide(color: RavenColors.ravenPrimaryGreen3, width: .8),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                color: RavenColors.ravenGrey4.withOpacity(.3),
                width: .8,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(
                color: Color(0xffF9F9F9),
                width: 1.2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                  color: Colors.red[300] ?? Colors.red.withOpacity(0.5),
                  width: 1.2),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                  color: Colors.red[300] ?? Colors.red.withOpacity(0.5),
                  width: 1.2),
            ),
          ),
        )
      ],
    );
  }

  Widget getSuffixIcon() {
    if (!widget.isPasswordField) {
      return const SizedBox();
    } else {
      if (obscure) {
        return GestureDetector(
          onTap: () {
            setState(() {
              obscure = !obscure;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              child: SvgPicture.asset(
                'assets/svgs/eye_off.svg',
                package: 'raven_widgets',
              ),
            ),
          ),
        );
      } else {
        return GestureDetector(
          onTap: () {
            setState(() {
              obscure = !obscure;
            });
          },
          // child: Padding(
          //   padding: const EdgeInsets.all(10),
          //   child: SizedBox(
          //     child: SvgPicture.asset(
          //         'packages/raven_widgets/assets/svgs/eye_off.svg'),
          //   ),
          // ),
        );
      }
    }
  }
}
