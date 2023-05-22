import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_vida_saludable/config/utils/errors/auth_errors.dart';
import 'package:app_vida_saludable/domain/entities/entities.dart';
import 'package:app_vida_saludable/domain/repositories/repositories.dart';
import 'package:app_vida_saludable/infrastructure/datasources/datasources.dart';
import 'package:app_vida_saludable/infrastructure/repositories/repositories.dart';

// Provider
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authRepository = AuthRepositoryImpl(AuthDataSourceImpl());

  return AuthNotifier(authRepository: authRepository);
});

// Notifier
class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository authRepository;

  AuthNotifier({required this.authRepository}) : super(AuthState());

  Future<void> login(String dui, String password) async {
    try {
      final loginResponse = await authRepository.login(dui, password);
      print(loginResponse.token);
      _setLoggedUser(loginResponse);
    } on CustomError catch (e) {
      logout(e.message);
    } catch (e) {
      logout('Error no controlado');
    }
  }

  Future<void> registerUser(String dui, String password) async {}

  Future<void> checkAuthStatus() async {}

  void _setLoggedUser(LoginResponse loginResponse) {
    state = state.copyWith(
      loginResponse: loginResponse,
      authStatus: AuthStatus.authenticaded,
    );
  }

  Future<void> logout([String? errorMessage]) async {
    state = state.copyWith(
      loginResponse: null,
      authStatus: AuthStatus.notAuthenticaded,
      errorMessage: errorMessage,
    );
  }
}

// State
enum AuthStatus { checking, authenticaded, notAuthenticaded }

class AuthState {
  final AuthStatus authStatus;
  final LoginResponse? loginResponse;
  final String errorMessage;

  AuthState({
    this.authStatus = AuthStatus.checking,
    this.loginResponse,
    this.errorMessage = '',
  });

  AuthState copyWith({
    AuthStatus? authStatus,
    LoginResponse? loginResponse,
    String? errorMessage,
  }) =>
      AuthState(
        authStatus: authStatus ?? this.authStatus,
        loginResponse: loginResponse ?? this.loginResponse,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
