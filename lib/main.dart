import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_vida_saludable/config/router/app_router.dart';
import 'package:app_vida_saludable/config/theme/app_theme.dart';

Future<void> main() async {
  // Cargar Variables de entorno
  await dotenv.load(fileName: '.env');

  // Implementar Riverpod(Gestor de estado) que contiene la referencia a todos los Providers
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: AppTheme().getTheme(),
    );
  }
}
