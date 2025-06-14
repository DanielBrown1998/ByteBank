import 'package:flutter/material.dart';

class ResponseDialog extends StatelessWidget {
  final String title;
  final String message;
  final String buttonText;
  final IconData? icon;
  final Color colorIcon;

  ResponseDialog({
    this.title = "",
    this.message = "",
    this.icon,
    this.buttonText = 'Ok',
    this.colorIcon = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Visibility(visible: title.isNotEmpty, child: Text(title)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Visibility(
            visible: icon != null,
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Icon(icon, size: 64, color: colorIcon),
            ),
          ),
          Visibility(
            visible: message.isNotEmpty,
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24.0),
              ),
            ),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          child: Text(buttonText),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}

class SuccessDialog extends StatelessWidget {
  final String title;
  final String message;
  final IconData icon;

  SuccessDialog(this.message, {this.title = 'Success', this.icon = Icons.done});

  @override
  Widget build(BuildContext context) {
    return ResponseDialog(
      title: title,
      message: message,
      icon: icon,
      colorIcon: Colors.green,
    );
  }
}

class FailureDialog extends StatelessWidget {
  final String title;
  final String message;
  final IconData icon;

  FailureDialog(
    this.message, {
    this.title = 'Failure',
    this.icon = Icons.warning,
  });

  @override
  Widget build(BuildContext context) {
    return ResponseDialog(
      title: title,
      message: message,
      icon: icon,
      colorIcon: Colors.red,
    );
  }
}
