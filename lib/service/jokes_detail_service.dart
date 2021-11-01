import 'dart:convert';
import 'dart:developer';

import 'package:chucknorrisjokes/core/utils/api_constant.dart';
import 'package:chucknorrisjokes/model/jokes_detail_model.dart';
import 'package:http/http.dart' as http;

class JokesDetailService {
  Future<JokesDetailModel?> getJokesDetail({
    required String category,
  }) async {
    final response = await http.get(
      Uri.parse(
        ApiUrls.jokesDetail + "?category=$category",
      ),
    );

    if (response.statusCode == 200) {
      log('SUCCES JokesDetailService - ${response.statusCode}');
      final result = json.decode(response.body);

      return JokesDetailModel.fromJson(result);
    } else {
      log('ERROR JokesDetailService - ${response.statusCode}');
    }
  }
}
