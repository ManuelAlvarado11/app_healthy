import 'package:app_vida_saludable/presentation/providers/providers.dart';
import 'package:app_vida_saludable/presentation/screens/screens.dart';

Future<String?> redirectTo(isGoingTo, authStatus) async {
  // SPLASH CHECKING AUTH STATUS
  if (isGoingTo == SplashCheckAuthScreen.routeName &&
      authStatus == AuthStatus.checking) return null;

  // SPLASH CHECKED AUTH STATUS
  if (isGoingTo == SplashCheckAuthScreen.routeName &&
      authStatus == AuthStatus.notAuthenticaded) {
    return Future.delayed(const Duration(seconds: 2))
        .then((_) => LoginScreen.routeName);
  }

  // NO AUTHENTICATED
  if (authStatus == AuthStatus.notAuthenticaded) {
    if (isGoingTo == LoginScreen.routeName ||
        isGoingTo == RegisterScreen.routeName ||
        isGoingTo == ForgotPassScreen.routeName) return null;
    return LoginScreen.routeName;
  }

  // AUTHENTICADED
  if (authStatus == AuthStatus.authenticaded) {
    if (isGoingTo == SplashCheckAuthScreen.routeName ||
        isGoingTo == LoginScreen.routeName ||
        isGoingTo == RegisterScreen.routeName ||
        isGoingTo == ForgotPassScreen.routeName) {
      return '${PagesScreen.routeName}/0';
    }
  }
  return null;
}
