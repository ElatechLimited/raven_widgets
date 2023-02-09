import 'package:flutter/material.dart';
import 'dart:async';

/// Provides a universal snack bar
/// Must be a child of a scaffold
/// Simply wrap the content with [GeneralMsgWrapper]
class GeneralMsgWrapper extends StatefulWidget {
  /// The content that will appear from this widget
  final Widget content;
  const GeneralMsgWrapper(this.content);

  @override
  _GeneralMsgWrapperState createState() => _GeneralMsgWrapperState();
}

/// The state of the [GeneralMsgWrapper] Widget
class _GeneralMsgWrapperState extends State<GeneralMsgWrapper> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await for (var message in GeneralSnackBarBloc.newMessage) {
        showSnackBar(message);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// Shows the snackbar on any [GlobalSnackBar] widgets
  void showSnackBar(GeneralMsg msg) {
    SnackBar bar = SnackBar(
      content: Text(
        msg.text,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: msg.bgColor,
    );

    ScaffoldMessenger.of(context)
        //..hideCurrentSnackBar()
        .showSnackBar(bar);
  }

  @override
  Widget build(BuildContext context) {
    return widget.content;
  }
}

/// Provides a model for global messages
class GeneralMsg {
  GeneralMsg(this.text, {required this.bgColor});

  /// Text to show in snackbar
  String text = "";

  /// Background color of snackbar
  Color bgColor = Colors.teal;
}

/// Provides the stream logic for the [GlobalSnackBar]
class GeneralSnackBarBloc {
  /// Create a new [streamController] to handle broadcasting to a [Stream]
  static final streamController =
      StreamController.broadcast(); // create a StreamController or
  // final counterController = PublishSubject() or any other rxdart option;

  /// Provides a [Stream] for new messages
  static Stream get newMessage =>
      streamController.stream; // create a getter for our Stream
  // the rxdart stream controllers returns an Observable instead of a Stream

  /// Method to show a [SnackBar] message on any [GlobalSnackBar] Widgets
  static void showMessage(GeneralMsg data) {
    streamController.sink.add(data); // add whatever data we want into the Sink
  }

  /// Allows for the stream to be closed
  dispose() {
    streamController.close();
  }
}
