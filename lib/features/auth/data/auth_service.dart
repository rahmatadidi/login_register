import 'package:dio/dio.dart';
import 'package:login_register/core/config/api_service.dart';
import 'package:login_register/core/constant/api_constant.dart';

class AuthService {
  final ApiService _apiClient = ApiService();

  Future<String> registerUser(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final response = await _apiClient.dio.post(ApiConstants.registerEndpoint,
          data: {"name": name, "email": email, "password": password});

      if (response.statusCode == 201) {
        return "User Registered Succesfully!";
      } else {
        return "Registration Failed!!";
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data["error"] ?? "Registration Failed");
    }
  }
}
