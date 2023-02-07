import 'package:flutter/material.dart';
import 'package:raven_widgets/raven_widgets.dart';

class ButtonExample extends StatelessWidget {
  const ButtonExample({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
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
                icon: Icon(Icons.add, color: RavenColors.ravenWhite))
          ],
        ));
  }
}
