import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_vida_saludable/domain/entities/entities.dart';
import 'package:app_vida_saludable/domain/repositories/repositories.dart';
import 'package:app_vida_saludable/presentation/providers/providers.dart';

// PROVIDER
final alimentacionProvider =
    StateNotifierProvider<AlimentacionNotifier, AlimentacionState>((ref) {
  final alimentacionRepository = ref.watch(alimentacionRepositoryProvider);
  return AlimentacionNotifier(alimentacionRepository: alimentacionRepository);
});

// NOTIFIER
class AlimentacionNotifier extends StateNotifier<AlimentacionState> {
  final AlimentacionRepository alimentacionRepository;

  AlimentacionNotifier({required this.alimentacionRepository})
      : super(AlimentacionState()) {
    getRecomendaciones(2);
    getContenidos(3);
  }

  Future getRecomendaciones(int tipo) async {
    state = state.copyWith(isLoading: true);

    final recomendaciones =
        await alimentacionRepository.getRecomendaciones(tipo);

    state = state.copyWith(
      isLoading: false,
      recomendaciones: recomendaciones,
    );
  }

  Future getContenidos(int tipo) async {
    state = state.copyWith(isLoading: true);

    final contenidos = await alimentacionRepository.getContenidos(tipo);

    state = state.copyWith(
      isLoading: false,
      contenidos: contenidos,
    );
  }
}

// STATE
class AlimentacionState {
  final bool isLoading;
  final List<RecomendacionResponse> recomendaciones;
  final List<ContenidoResponse> contenidos;

  AlimentacionState({
    this.isLoading = false,
    this.recomendaciones = const [],
    this.contenidos = const [],
  });

  AlimentacionState copyWith({
    bool? isLoading,
    List<RecomendacionResponse>? recomendaciones,
    List<ContenidoResponse>? contenidos,
  }) =>
      AlimentacionState(
        isLoading: isLoading ?? this.isLoading,
        recomendaciones: recomendaciones ?? this.recomendaciones,
        contenidos: contenidos ?? this.contenidos,
      );
}
