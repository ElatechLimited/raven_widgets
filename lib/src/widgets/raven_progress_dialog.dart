import 'package:flutter/material.dart';
import 'package:raven_widgets/src/themes/colors/raven_colors.dart';
import 'package:raven_widgets/src/themes/text_styles.dart';

class ProgressDialog extends StatelessWidget {
  final String status;

  const ProgressDialog({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.all(16.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              const SizedBox(
                width: 5.0,
              ),
              CircularProgressIndicator(
                semanticsLabel: 'Please wait',
                valueColor: AlwaysStoppedAnimation<Color>(
                    RavenColors.ravenPrimaryGreen1),
              ),
              const SizedBox(
                width: 25.0,
              ),
              Text(
                status,
                style: bodyText1.copyWith(fontSize: 15.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
