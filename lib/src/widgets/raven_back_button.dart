import 'package:flutter/material.dart';

class RavenBackButton extends StatelessWidget {
  const RavenBackButton({super.key, this.onPressed});
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed ?? () => Navigator.pop(context),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        child: const Padding(
            padding: EdgeInsets.all(8),
            child: Icon(
              Icons.keyboard_arrow_left,
              color: Colors.black,
            )),
      ),
    );
  }
}
