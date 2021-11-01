import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:chucknorrisjokes/core/extension/context_extension.dart';

class CustomTextStyles {
  const CustomTextStyles(this.context) : super();
  final BuildContext context;
  TextStyle headline1({
     Color? fontColor,
    required FontWeight fontWeight,
    double? height,
  }) {
    return TextStyle(
      fontSize: 17 * (context.screenWidth / 3) / 100,
      fontWeight: fontWeight,
      color: fontColor,
      height: height,
    );
  }
}
