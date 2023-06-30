import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_vida_saludable/domain/entities/entities.dart';
import 'package:app_vida_saludable/domain/repositories/repositories.dart';

import 'package:app_vida_saludable/infrastructure/datasources/datasources.dart';
import 'package:app_vida_saludable/infrastructure/repositories/repositories.dart';

import 'package:app_vida_saludable/presentation/providers/providers.dart';

// Repository Provider
final recomndacionesRepositoryProvider =
    Provider<AlimentacionRepository>((ref) {
  final accessToken = ref.watch(authProvider).loginResponse?.token ?? '';

  return AlimentacionRepositoryImpl(
      AlimentacionDataSourceImpl(accessToken: accessToken));
});

// Provider
final alimentacionProvider =
    StateNotifierProvider<AlimentacionNotifier, AlimentacionState>((ref) {
  final recomndacionesRepository = ref.watch(recomndacionesRepositoryProvider);
  return AlimentacionNotifier(alimentacionRepository: recomndacionesRepository);
});

// Notifier
class AlimentacionNotifier extends StateNotifier<AlimentacionState> {
  final AlimentacionRepository alimentacionRepository;

  AlimentacionNotifier({
    required this.alimentacionRepository,
  }) : super(AlimentacionState()) {
    getRecomendaciones();
  }

  Future getRecomendaciones() async {
    state = state.copyWith(
      isLoading: true,
    );

    final recomendaciones = await alimentacionRepository.getRecomendaciones(2);

    state = state.copyWith(
      isLoading: false,
      recomendaciones: recomendaciones,
    );
  }
}

// State
class AlimentacionState {
  final bool isLoading;
  final List<RecomendacionResponse> recomendaciones;

  AlimentacionState({
    this.isLoading = false,
    this.recomendaciones = const [],
  });

  AlimentacionState copyWith({
    bool? isLoading,
    List<RecomendacionResponse>? recomendaciones,
  }) =>
      AlimentacionState(
        isLoading: isLoading ?? this.isLoading,
        recomendaciones: recomendaciones ?? [],
      );
}
