import 'package:dio/dio.dart';

class MedicalNewsApiService {
  final Dio dio;
  static const String baseUrl = 'https://newsdata.io/api/1/';

  MedicalNewsApiService(this.dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await dio.get('$baseUrl$endPoint');
    return response.data;
  }
}
