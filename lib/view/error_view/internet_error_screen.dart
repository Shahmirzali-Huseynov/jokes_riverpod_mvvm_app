import 'package:chucknorrisjokes/core/utils/colors.dart';
import 'package:chucknorrisjokes/core/utils/custom_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:chucknorrisjokes/core/extension/context_extension.dart';

class InternetErrorScreen extends StatelessWidget {
  const InternetErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst().whiteColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: ColorConst().whiteColor,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.1),
          child: Text(
            "Slow or no internet connection. Please check your internet settings",
            textAlign: TextAlign.center,
            style: CustomTextStyles(context).headline1(
              fontColor: ColorConst().whiteColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
