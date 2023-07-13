import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_vida_saludable/domain/entities/entities.dart';
import 'package:app_vida_saludable/domain/repositories/repositories.dart';
import 'package:app_vida_saludable/presentation/providers/providers.dart';

// STATE
class SharedState {
  final bool isLoading;
  final List<DepartamentoResponse> departamentos;
  final List<MunicipioResponse> municipios;

  SharedState({
    this.isLoading = false,
    this.departamentos = const [],
    this.municipios = const [],
  });

  SharedState copyWith({
    bool? isLoading,
    List<DepartamentoResponse>? departamentos,
    List<MunicipioResponse>? municipios,
  }) =>
      SharedState(
        isLoading: isLoading ?? this.isLoading,
        departamentos: departamentos ?? this.departamentos,
        municipios: municipios ?? this.municipios,
      );
}

// NOTIFIER
class SharedNotifier extends StateNotifier<SharedState> {
  final SharedRepository sharedRepository;

  SharedNotifier({required this.sharedRepository}) : super(SharedState()) {
    getDepartamentos();
    getMunicipios();
  }

  Future getDepartamentos() async {
    state = state.copyWith(isLoading: true);

    final departamentos = await sharedRepository.getDepartamentos();

    state = state.copyWith(isLoading: false, departamentos: departamentos);
  }

  Future getMunicipios() async {
    state = state.copyWith(isLoading: true);

    final municipios = await sharedRepository.getMunicipios(1);

    state = state.copyWith(isLoading: false, municipios: municipios);
  }
}

// PROVIDER
final sharedProvider =
    StateNotifierProvider<SharedNotifier, SharedState>((ref) {
  final sharedRepository = ref.watch(sharedRepositoryProvider);

  return SharedNotifier(sharedRepository: sharedRepository);
});
