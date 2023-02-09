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
                controller: TextEditingController())
          ],
        ));
  }
}
