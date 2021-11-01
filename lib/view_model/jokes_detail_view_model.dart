import 'dart:io';
import 'package:chucknorrisjokes/model/jokes_detail_model.dart';
import 'package:chucknorrisjokes/service/jokes_detail_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final jokesDetailViewModelProvider = ChangeNotifierProvider((ref) => JokesDetailViewModel());

enum JokesDetailStatus { LOADING, COMPLETED, NOT_INTERNET_CONNECTION, ERROR }

class JokesDetailViewModel extends ChangeNotifier {
  JokesDetailStatus _getLoadingStaus = JokesDetailStatus.LOADING;
  JokesDetailStatus get getLoadingStaus => _getLoadingStaus;

  JokesDetailModel? _getJokesDetail = JokesDetailModel();
  JokesDetailModel? get getJokesDetail => _getJokesDetail;

  Future<void> jokesDetailViewModel({
    required String category,
  }) async {
    _getLoadingStaus = JokesDetailStatus.LOADING;

    notifyListeners();
    try {
      _getJokesDetail = await JokesDetailService().getJokesDetail(category: category);

      _getLoadingStaus = JokesDetailStatus.COMPLETED;
    } on SocketException {
      _getLoadingStaus = JokesDetailStatus.NOT_INTERNET_CONNECTION;
    } catch (error) {
      _getLoadingStaus = JokesDetailStatus.ERROR;
    } finally {
      notifyListeners();
    }
  }
}
