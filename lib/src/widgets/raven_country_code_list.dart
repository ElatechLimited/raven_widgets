// ignore_for_file: library_private_types_in_public_api

import 'package:country_list/country_list.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:raven_widgets/src/helpers/country_emoji.dart';
import 'package:raven_widgets/src/themes/colors/raven_colors.dart';
import 'package:raven_widgets/src/themes/text_styles.dart';
import 'package:raven_widgets/src/widgets/raven_bottom_sheet.dart';
import 'package:raven_widgets/src/widgets/raven_button_loader.dart';

//Add all List of supported Country Alpha here
const List<String> supportedCountriesAlpha2 = ['NG'];
const List<String> allCountries = [
  'NG',
  'GH',
  'UG',
  'ZA',
  'KE',
  'US',
  'AE',
  'CA'
];

class RavenCountry {
  RavenCountry({
    required this.emoji,
    required this.name,
    required this.isSupported,
    required this.isoCode,
    required this.phoneCode,
  });
  factory RavenCountry.fromCountry(Country country) {
    return RavenCountry(
      emoji: kFlagsEmoji[country.isoCode] ?? "",
      name: country.name,
      phoneCode: country.dialCode,
      isoCode: country.isoCode,
      isSupported: supportedCountriesAlpha2.contains(country.isoCode),
    );
  }

  String emoji;
  String name;
  String phoneCode;
  String isoCode;
  bool isSupported;

  @override
  String toString() {
    return '[$name, $isoCode, $phoneCode, $isSupported]';
  }
}

class CountryCodePickerList extends StatefulWidget {
  const CountryCodePickerList({Key? key, required this.onSelected})
      : super(key: key);

  final Function(RavenCountry) onSelected;

  @override
  _CountryCodePickerListState createState() => _CountryCodePickerListState();
}

class _CountryCodePickerListState extends State<CountryCodePickerList> {
  late TextEditingController _searchController;
  List<RavenCountry>? _searchResults;
  List<RavenCountry>? _allCountries;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    fetchCountries();
  }

  dynamic fetchCountries() async {
    final list = Countries.list
        .map((e) => RavenCountry.fromCountry(e))
        .toList()
        .where((e) => allCountries.contains(e.isoCode))
        .where((e) => kFlagsEmoji.containsKey(e.isoCode))
        .toList()
      ..sort(
        (a, b) => (a.isSupported == true ? 0 : 1)
            .compareTo(b.isSupported == true ? 0 : 1),
      );

    _searchResults = _allCountries = list;
    setState(() {});
  }

  void searchList(String value) {
    _searchResults = _allCountries
        ?.where((e) => e.name.toLowerCase().contains(value.toLowerCase()))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SizedBox(
        height: size.height / 2,
        child: _searchResults == null
            ? Center(
                child: RavenButtonLoader(
                  size: 20,
                  color: RavenColors.ravenPrimaryGreen2,
                ),
              )
            : Column(
                children: [
                  const Gap(
                    8,
                  ),
                  const RavenBottomSheetCapsule(),
                  const Gap(
                    20,
                  ),
                  TextField(
                    onChanged: searchList,
                    style: bodyText1.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: RavenColors.ravenPrimaryGreen2,
                    ),
                    keyboardType: TextInputType.text,
                    controller: _searchController,
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        size: 20,
                        color: RavenColors.ravenGrey4.withOpacity(.3),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          _searchController.clear();
                          _searchResults = _allCountries;
                          setState(() {});
                        },
                        child: const Icon(
                          Icons.cancel_outlined,
                          size: 20,
                        ),
                      ),
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
                        color: const Color(0xffC4C4C4),
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                      hintText: 'Search countries',
                      errorStyle: const TextStyle(color: Colors.red),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(
                            color: RavenColors.ravenPrimaryGreen, width: .8),
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
                            color: RavenColors.ravenRedShade, width: 1.2),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(
                            color: RavenColors.ravenRedShade, width: 1.2),
                      ),
                    ),
                  ),
                  const Gap(
                    20,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _searchResults?.length,
                      itemBuilder: (BuildContext context, int index) {
                        final item = _searchResults?[index];
                        return CountryItem(
                          item: item!,
                          onSelected: widget.onSelected,
                        );
                      },
                    ),
                  )
                ],
              ),
      ),
    );
  }
}

class CountryItem extends StatelessWidget {
  const CountryItem({Key? key, required this.item, required this.onSelected})
      : super(key: key);
  final RavenCountry item;
  final Function(RavenCountry) onSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (item.isSupported == true) {
          onSelected(item);
          Navigator.of(context).pop();
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            Text(
              item.emoji,
              style: bodyText1.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 24,
              ),
            ),
            const Gap(
              5,
            ),
            Expanded(
              child: Text(
                item.name,
                style: bodyText1.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: item.isSupported == true
                      ? const Color(0xff0C0C0C)
                      : RavenColors.ravenGrey4.withOpacity(.5),
                ),
              ),
            ),
            if (item.isSupported == true)
              const SizedBox()
            else
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.lock_outlined,
                      size: 16,
                      color: RavenColors.ravenGrey4.withOpacity(.5),
                    )
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
