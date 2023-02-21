import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

void disposeKeyboard() {
  return FocusManager.instance.primaryFocus?.unfocus();
}
