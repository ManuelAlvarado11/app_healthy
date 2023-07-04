import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:app_vida_saludable/domain/repositories/repositories.dart';
import 'package:app_vida_saludable/infrastructure/datasources/datasources.dart';
import 'package:app_vida_saludable/infrastructure/repositories/repositories.dart';
import 'package:app_vida_saludable/presentation/providers/providers.dart';

final alimentacionRepositoryProvider = Provider<AlimentacionRepository>((ref) {
  final accessToken = ref.watch(authProvider).loginResponse?.token ?? '';

  return AlimentacionRepositoryImpl(
      AlimentacionDataSourceImpl(accessToken: accessToken));
});
