import 'package:flutter/material.dart';
import 'package:raven_widgets/raven_widgets.dart';

class TextFieldExample extends StatelessWidget {
  const TextFieldExample({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 24),
        child: Column(
          children: [
            RavenText.headingTwo("TextFeild Example"),
            const Gap(8),
            RavenTextField(
                labelText: "Username",
                hintText: "Enter Username",
                controller: TextEditingController()),
            const Gap(8),
            RavenTextField(
                labelText: "Name",
                hintText: "Enter Username",
                controller: TextEditingController()),
            const Gap(8),
            RavenTextField(
                obscure: true,
                labelText: "Password",
                hintText: "Enter Password",
                isPasswordField: true,
                controller: TextEditingController()),
            const Gap(8),
            RavenTextField(
                labelText: "Drop Down",
                inputType: TextInputType.none,
                hintText: "Select Item",
                onTap: () {
                  showRavenBottomSheet(context,
                      child: const RavenSimpleListTile(
                        thisList: [
                          "Collect business payments",
                          "Agency banking",
                          "Collect business payments",
                          "Agency banking",
                          "Collect business payments",
                          "Agency banking",
                        ],
                        containerHeight: 250,
                      ));
                },
                suffixIcon: dropDownIcon(),
                controller: TextEditingController()),
            const Gap(8),
            RavenTextField(
                labelText: "Search TextField",
                hintText: "Search Item here...",
                prefixIcon: searchIcon(),
                controller: TextEditingController()),
            const Gap(8),
            RavenTextField(
                labelText: "Cancel TextField",
                hintText: "cancle Item here...",
                suffixIcon: cancelIcon(),
                controller: TextEditingController()),
            const Gap(8),
            RavenPhoneTextField(
                labelText: "Phone", controller: TextEditingController()),
            const Gap(24),
            RavenPinWidget(
                height: 40,
                width: 40,
                pinController: TextEditingController(),
                onSubmit: (val) {},
                onChanged: (val) {},
                onComplete: (val) {})
          ],
        ));
  }
}
