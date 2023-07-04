import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:app_vida_saludable/config/theme/app_colors.dart';
import 'package:app_vida_saludable/presentation/widgets/widgets.dart';
import 'package:app_vida_saludable/presentation/providers/providers.dart';

class ContenidoAlimentacionScreen extends StatelessWidget {
  static const routeName = 'contenido-alimentacion-screen';

  const ContenidoAlimentacionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            child: Material(
              elevation: 2,
              color: AppColors.white,
              borderRadius: BorderRadius.circular(50),
              child: CupertinoSearchTextField(
                prefixIcon: const Icon(MdiIcons.magnify),
                borderRadius: BorderRadius.circular(50),
                onChanged: (value) => {},
              ),
            ),
          ),
          _ContenidosList(),
        ],
      ),
    );
  }
}

class _ContenidosList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // PROVIDER
    final provider = ref.watch(alimentacionProvider);

    return Flexible(
      child: provider.contenidos.isEmpty
          ? const Center(
              child: ResultEmptyWidget(
                mensajeVacio: 'No hay contenido de categoria',
                urlImagen: "assets/svg/vacio_alimentacion.svg",
              ),
            )
          : RefreshIndicator(
              onRefresh: () async {
                ref.read(alimentacionProvider.notifier).getContenidos(3);
              },
              color: AlimentacionColors.secondary,
              backgroundColor: Colors.white,
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  ...provider.contenidos.toList().map((contenido) {
                    return CustomCardContentWidget(
                      contenido: contenido,
                      tipo: 3,
                    );
                  }).toList(),
                ],
              ),
            ),
    );
  }
}
