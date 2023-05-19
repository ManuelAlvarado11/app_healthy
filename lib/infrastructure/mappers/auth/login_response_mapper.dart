import 'package:app_vida_saludable/domain/entities/entities.dart';

class LoginResponseMapper {
  static LoginResponse loginResponseJsonToEntity(Map<String, dynamic> json) =>
      LoginResponse(
        token: json['token'] ?? '',
        refreshToken: json['refreshToken'],
      );
}
