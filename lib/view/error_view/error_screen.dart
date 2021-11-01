import 'package:flutter/material.dart';
import 'package:chucknorrisjokes/core/utils/colors.dart';
import 'package:chucknorrisjokes/core/utils/custom_textstyle.dart';
import 'package:chucknorrisjokes/core/extension/context_extension.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.1),
        child: Text(
          "There is some problem here, try again or later",
          textAlign: TextAlign.center,
          style: CustomTextStyles(context).headline1(
            fontColor: ColorConst().whiteColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
