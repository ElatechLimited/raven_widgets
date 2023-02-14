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
            RavenButton(
              buttonText: "Raven Lighter Button",
              fontWeight: FontWeight.w300,
              onPressed: () {},
            ),
            const Gap(8),
            RavenButton(
              buttonText: "Raven Light Button",
              fontWeight: FontWeight.w400,
              onPressed: () {},
            ),
            const Gap(8),
            RavenButton(
              buttonText: "Raven Icon",
              showIcon: true,
              icon:
                  const Icon(Icons.arrow_forward_outlined, color: Colors.white),
              fontWeight: FontWeight.w400,
              onPressed: () {},
            ),
            const Gap(8),
            RavenButton(buttonText: "Raven Default Button", onPressed: () {}),
            const Gap(8),
            RavenButton(
              buttonText: "Raven Button",
              onPressed: () {},
              busy: true,
            ),
            const Gap(8),
            RavenButton(
              buttonText: "Raven Disabled Button",
              onPressed: () {},
              enabled: false,
            ),
            const Gap(8),
            RavenOutlinedButton(
              buttonText: "Raven Button",
              onPressed: () {},
            ),
            const Gap(8),
            RavenOutlinedButton(
              busy: true,
              buttonText: "Raven Button",
              onPressed: () {},
            ),
            const Gap(8),
            RavenOutlinedButton(
              fontWeight: FontWeight.w300,
              buttonText: "Raven Button",
              textColor: RavenColors.ravenGrey1,
              borderColor: RavenColors.ravenGrey1.withOpacity(0.4),
              onPressed: () {},
            ),
            const Gap(8),
            RavenOutlinedButton(
              busy: true,
              fontWeight: FontWeight.w300,
              buttonText: "Raven Button",
              textColor: RavenColors.ravenGrey1,
              borderColor: RavenColors.ravenGrey1.withOpacity(0.4),
              onPressed: () {},
            ),
            const Gap(8),
            RavenRoundedButton(
                onPressed: () {},
                icon: Icon(Icons.add, color: RavenColors.ravenWhite)),
            const Gap(24),
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
