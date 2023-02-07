import 'package:example/buttons_example.dart';
import 'package:flutter/material.dart';
import 'package:raven_widgets/raven_widgets.dart';

void main() {
  runApp(const RavenCookBook());
}

class RavenCookBook extends StatefulWidget {
  const RavenCookBook({super.key});

  @override
  State<RavenCookBook> createState() => _RavenCookBookState();
}

class _RavenCookBookState extends State<RavenCookBook> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                backgroundColor: RavenColors.ravenPrimaryGreen,
                title: const Text("Raven Cook Book")),
            body: const ButtonExample()));
  }
}
