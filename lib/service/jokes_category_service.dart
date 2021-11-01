import 'dart:convert';
import 'dart:developer';
import 'package:chucknorrisjokes/core/utils/api_constant.dart';
import 'package:http/http.dart' as http;

class JokesCateoryService {
  Future<List<void>> getJokesCategoryService() async {
    final response = await http.get(
      Uri.parse(
        ApiUrls.jokesCategory,
      ),
    );
    if (response.statusCode == 200) {
      log('SUCCES getJokesCategoryService - ${response.statusCode}');
      final result = json.decode(response.body);

      Iterable list = result;
      return list.toList();
    } else {
      log('ERROR getJokesCategoryService - ${response.statusCode}');
      return [];
    }
  }
}
