import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_vida_saludable/config/utils/errors/auth_errors.dart';
import 'package:app_vida_saludable/domain/entities/entities.dart';
import 'package:app_vida_saludable/domain/repositories/repositories.dart';
import 'package:app_vida_saludable/infrastructure/datasources/datasources.dart';
import 'package:app_vida_saludable/infrastructure/repositories/repositories.dart';
import 'package:app_vida_saludable/infrastructure/services/services.dart';

// Provider
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authRepository = AuthRepositoryImpl(AuthDataSourceImpl());
  final localStorageService = LocalStorageServiceImpl();

  return AuthNotifier(
    authRepository: authRepository,
    localStorageService: localStorageService,
  );
});

// Notifier
class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository authRepository;
  final LocalStorageService localStorageService;

  AuthNotifier({
    required this.authRepository,
    required this.localStorageService,
  }) : super(AuthState()) {
    checkAuthStatus();
  }

  Future<void> login(String dui, String password) async {
    try {
      final loginResponse = await authRepository.login(dui, password);
      _setLoggedUser(loginResponse);
    } on CustomError catch (e) {
      logout(e.message);
    } catch (e) {
      logout('Error no controlado');
    }
  }

  Future<void> registerUser(String dui, String password) async {}

  Future<void> checkAuthStatus() async {
    final refreshToken =
        await localStorageService.getLocalStorage<String>('refresh_token');

    if (refreshToken == null) return logout();

    try {
      final loginResponse = await authRepository.checkAuthStatus(refreshToken);
      _setLoggedUser(loginResponse);
    } catch (e) {
      logout();
    }
  }

  void _setLoggedUser(LoginResponse loginResponse) async {
    await localStorageService.setLocalStorage('token', loginResponse.token);
    await localStorageService.setLocalStorage(
        'refresh_token', loginResponse.refreshToken);

    state = state.copyWith(
      loginResponse: loginResponse,
      authStatus: AuthStatus.authenticaded,
      errorMessage: '',
    );
  }

  Future<void> logout([String? errorMessage]) async {
    await localStorageService.removeLocalStorage('token');

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
