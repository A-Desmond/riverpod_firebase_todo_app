import 'package:flutter/material.dart';

class Alerts {
  static snackBar(BuildContext context, String msg) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(msg)));
  }
}
