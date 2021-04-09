import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

navigateToHome({BuildContext context, int menuType = 0}) {
  Navigator.of(context).popUntil((route) => route.isFirst);
}
