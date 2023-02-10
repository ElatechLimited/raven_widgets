import 'package:flutter/material.dart';
import 'package:raven_widgets/raven_widgets.dart';
import 'package:raven_widgets/src/themes/text_styles.dart';
import 'package:raven_widgets/src/widgets/raven_bottom_sheet.dart';

class RavenPhoneTextField extends StatefulWidget {
  const RavenPhoneTextField({
    Key? key,
    required this.controller,
    this.isRequired = true,
    this.initialCountry,
    this.labelText = 'Phone number',
    this.maxLength,
    this.onChanged,
  }) : super(key: key);

  final RavenCountry? initialCountry;
  final TextEditingController controller;
  final bool isRequired;
  final String labelText;
  final int? maxLength;
  final Function(String)? onChanged;

  @override
  _RavenPhoneFieldState createState() => _RavenPhoneFieldState();
}

class _RavenPhoneFieldState extends State<RavenPhoneTextField> {
  late RavenCountry _selectedCountry;

  @override
  void initState() {
    super.initState();
    _selectedCountry = widget.initialCountry ??
        RavenCountry(
          isSupported: true,
          isoCode: 'NG',
          name: 'Nigeria',
          phoneCode: '+234',
          emoji: '\u{1F1F3}\u{1F1EC}',
        );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              widget.labelText,
              style: bodyText2.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: RavenColors.ravenLabelColor),
            ),
            if (widget.isRequired) ...[
              const Gap(
                2,
              ),
            ]
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: RavenColors.ravenGrey5,
            ),
            color: const Color(0xffF7F8F7),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: () async {
                  await showRavenBottomSheet<RavenCountry>(
                    context,
                    child: CountryCodePickerList(
                      onSelected: (res) {
                        _selectedCountry = res;
                      },
                    ),
                  );

                  setState(() {});
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        color: RavenColors.ravenGrey5,
                      ),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Text(
                        _selectedCountry.emoji,
                        style: bodyText1.copyWith(
                          fontSize: 24,
                        ),
                      ),
                      const Gap(
                        2,
                      ),
                      const Icon(
                        Icons.arrow_drop_down,
                        size: 22,
                        color: Color(0xffC4C4C4),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TextField(
                  style: bodyText1.copyWith(
                      fontSize: 16,
                      color: RavenColors.ravenTextFieldColor,
                      fontWeight: FontWeight.w400),
                  onChanged: widget.onChanged,
                  keyboardType: TextInputType.number,
                  enabled: _selectedCountry != null,
                  controller: widget.controller,
                  textInputAction: TextInputAction.done,
                  maxLength: widget.maxLength,
                  decoration: InputDecoration(
                    counterText: '',
                    prefixText: '${_selectedCountry.phoneCode} ',
                    prefixStyle: bodyText1.copyWith(
                        color: RavenColors.ravenTextFieldColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                    fillColor: const Color(0xffF7F8F7),
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    hintStyle: bodyText1.copyWith(
                      color: const Color(0xffC4C4C4),
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                    errorStyle: const TextStyle(color: Colors.red),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide:
                          const BorderSide(color: Color(0xffF9F9F9), width: .8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(
                        color: RavenColors.ravenGrey5.withOpacity(0.0),
                        width: .0,
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
                          color: RavenColors.ravenRedShade, width: 1.2),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(
                          color: RavenColors.ravenRedShade, width: 1.2),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
