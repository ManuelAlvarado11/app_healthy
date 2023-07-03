import 'package:app_vida_saludable/domain/datasources/datasources.dart';
import 'package:app_vida_saludable/domain/entities/auth/login_response.dart';
import 'package:app_vida_saludable/domain/repositories/repositories.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthDataSource dataSource;

  AuthRepositoryImpl(this.dataSource);

  @override
  Future<LoginResponse> login(String dui, String password) {
    return dataSource.login(dui, password);
  }

  @override
  Future<LoginResponse> register(String dui, String password) {
    return dataSource.register(dui, password);
  }

  @override
  Future<LoginResponse> checkAuthStatus(String refreshToken) {
    return dataSource.checkAuthStatus(refreshToken);
  }
}
