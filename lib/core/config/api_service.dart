import 'package:dio/dio.dart';
import 'package:login_register/core/constant/api_constant.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(milliseconds: 5000),
      receiveTimeout: const Duration(milliseconds: 5000),
      headers: {"Content-type": "application/json"}));
  Dio get dio => _dio;
}
