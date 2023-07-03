import 'package:app_vida_saludable/domain/entities/entities.dart';

abstract class AuthRepository {
  Future<LoginResponse> login(String dui, String password);
  Future<LoginResponse> register(String dui, String password);
  Future<LoginResponse> checkAuthStatus(String refreshToken);
}
