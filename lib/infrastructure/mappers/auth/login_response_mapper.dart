import 'package:app_vida_saludable/domain/entities/entities.dart';

class LoginResponseMapper {
  static LoginResponse jsonToEntity(Map<String, dynamic> json) => LoginResponse(
        token: json['token'] ?? '',
        // TODO: Correguir camelCase API
        refreshToken: json['refreshToken'] ?? json['refresh_token'] ?? '',
      );
}
