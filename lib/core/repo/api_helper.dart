import 'package:dio/dio.dart';

class ApiHelper {
  final String _baseUrl = 'https://fakestoreapi.com/';
  final Dio _dio;

  ApiHelper(this._dio);

  Future<dynamic> get({required String endPoints}) async {
    var response = await _dio.get('$_baseUrl$endPoints');
    return response.data;
  }
}
