import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_vida_saludable/presentation/providers/providers.dart';

// Provider que brinda el estado de autenticacion al router atravez de RIVERPOD
final goRouterNotifierProvider = Provider((ref) {
  final authNotifier = ref.read(authProvider.notifier);
  return GoRouterNotifier(authNotifier);
});

// Notifica cambios en el authNotifier
class GoRouterNotifier extends ChangeNotifier {
  final AuthNotifier _authNotifier;

  AuthStatus _authStatus = AuthStatus.checking;

  // Escucha en todo momento cambios en el authNotifier
  GoRouterNotifier(this._authNotifier) {
    _authNotifier.addListener((state) {
      authStatus = state.authStatus;
    });
  }

  // GETTER
  AuthStatus get authStatus => _authStatus;

  // SETTER
  set authStatus(AuthStatus value) {
    _authStatus = value;
    notifyListeners();
  }
}
