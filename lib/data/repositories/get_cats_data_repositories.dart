// ignore_for_file: avoid_print

import 'package:cats_api/data/models/cats_data_models.dart';
import 'package:dio/dio.dart';

class GetCatsDataRepositories {
  final dio = Dio();
  Future getCatsData() async {
    try {
      final Response response =
          await dio.get('https://api.thecatapi.com/v1/images/search');
      CatsDataModel model = CatsDataModel.fromJson(response.data[0]);
      return model;
    } catch (e) {
      if (e is DioException) {
        return e.response?.data['message'];
      }
      return e.toString();
    }
  }
}
