import 'package:app_vida_saludable/domain/entities/entities.dart';

abstract class AuthDataSource {
  Future<LoginResponse> login(String dui, String password);
  Future<LoginResponse> register(String dui, String password);
  Future<LoginResponse> checkAuthStatus(String refreshToken);
}
