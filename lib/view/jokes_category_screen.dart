import 'package:chucknorrisjokes/core/utils/colors.dart';
import 'package:chucknorrisjokes/core/utils/custom_textstyle.dart';
import 'package:chucknorrisjokes/view/error_view/error_screen.dart';
import 'package:chucknorrisjokes/view/error_view/internet_error_screen.dart';
import 'package:chucknorrisjokes/view_model/jokes_category_view_model.dart';
import 'package:chucknorrisjokes/view_model/jokes_detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JokesCategoryScreen extends StatefulWidget {
  static const String routeName = '/jokes-category-screen';
  const JokesCategoryScreen({Key? key}) : super(key: key);

  @override
  _JokesCategoryScreenState createState() => _JokesCategoryScreenState();
}

class _JokesCategoryScreenState extends State<JokesCategoryScreen> {
  @override
  void initState() {
    context.read(getJokesCategoryProvider).getJokesCategoryViewModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Jokes Category',
        ),
      ),
      body: Consumer(builder: (context, watch, child) {
        final jokesCategory = watch(getJokesCategoryProvider);

        return jokesCategory.getLoadingStaus == JokesCategoryStatus.NOT_INTERNET_CONNECTION
            ? const InternetErrorScreen()
            : jokesCategory.getLoadingStaus == JokesCategoryStatus.ERROR
                ? const ErrorPage()
                : jokesCategory.getLoadingStaus != JokesCategoryStatus.COMPLETED
                    ? const Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                        ),
                      )
                    : ListView.builder(
                        itemCount: jokesCategory.getJokesCategoryList?.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              title: Text(
                                "${jokesCategory.getJokesCategoryList?[index]}",
                                style: CustomTextStyles(context).headline1(
                                  fontColor: ColorConst().blackColor,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              onTap: () {
                                context.read(jokesDetailViewModelProvider).jokesDetailViewModel(
                                      category: jokesCategory.getJokesCategoryList?[index],
                                    );
                                    Navigator.pushNamed(context, '/jokes-detail-screen');
                                  
                              },
                            ),
                          );
                        },
                      );
      }),
    );
  }
}
