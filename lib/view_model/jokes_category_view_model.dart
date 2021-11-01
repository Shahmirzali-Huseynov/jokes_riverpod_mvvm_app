import 'dart:io';
import 'package:chucknorrisjokes/service/jokes_category_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getJokesCategoryProvider = ChangeNotifierProvider((ref) => JokesCategoryViewModel());

enum JokesCategoryStatus { LOADING, COMPLETED, NOT_INTERNET_CONNECTION, ERROR }

class JokesCategoryViewModel extends ChangeNotifier {
  JokesCategoryStatus _getLoadingStaus = JokesCategoryStatus.LOADING;
  JokesCategoryStatus get getLoadingStaus => _getLoadingStaus;

  List? _getJokesCategoryList;
  List? get getJokesCategoryList => _getJokesCategoryList;

  Future<void> getJokesCategoryViewModel() async {
    try {
      _getJokesCategoryList = await JokesCateoryService().getJokesCategoryService();

      _getLoadingStaus = JokesCategoryStatus.COMPLETED;
    } on SocketException {
      _getLoadingStaus = JokesCategoryStatus.NOT_INTERNET_CONNECTION;
    } catch (error) {
      _getLoadingStaus = JokesCategoryStatus.ERROR;
    } finally {
      notifyListeners();
    }
  }
}
