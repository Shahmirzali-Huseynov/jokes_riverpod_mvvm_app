import 'package:chucknorrisjokes/core/utils/colors.dart';
import 'package:chucknorrisjokes/core/utils/custom_textstyle.dart';
import 'package:chucknorrisjokes/core/widgets/button_widget.dart';
import 'package:chucknorrisjokes/view/error_view/error_screen.dart';
import 'package:chucknorrisjokes/view/error_view/internet_error_screen.dart';
import 'package:chucknorrisjokes/view_model/jokes_detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chucknorrisjokes/core/extension/context_extension.dart';

class JokesDetailScreen extends StatelessWidget {
  static const String routeName = '/jokes-detail-screen';

  const JokesDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Jokes Detail',
        ),
      ),
      body: Consumer(builder: (context, watch, child) {
        final jokesDetail = watch(jokesDetailViewModelProvider);
        return jokesDetail.getLoadingStaus == JokesDetailStatus.NOT_INTERNET_CONNECTION
            ? const InternetErrorScreen()
            : jokesDetail.getLoadingStaus == JokesDetailStatus.ERROR
                ? const ErrorPage()
                : jokesDetail.getLoadingStaus != JokesDetailStatus.COMPLETED
                    ? const Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                        ),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Card(
                            margin: EdgeInsets.symmetric(
                              horizontal: context.screenWidth * 0.05,
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: context.screenWidth * 0.05,
                                vertical: context.screenWidth * 0.05,
                              ),
                              child: Text(
                                "${jokesDetail.getJokesDetail?.value}",
                                style: CustomTextStyles(context).headline1(
                                  fontColor: ColorConst().blackColor,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: context.screenHeight * 0.02,
                          ),
                          ButtonWidget(
                            text: 'Copy',
                            onClicked: () {
                              Clipboard.setData(
                                ClipboardData(
                                  text: jokesDetail.getJokesDetail?.value,
                                ),
                              );
                            },
                          ),
                        ],
                      );
      }),
    );
  }
}
