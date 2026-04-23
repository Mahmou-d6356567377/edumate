import 'package:edumate/config/routes/routes.dart';
import 'package:edumate/core/themes/app_theme.dart';
import 'package:edumate/core/themes/controller/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();

  // Open boxes
  await Hive.openBox('settings');

  // Initialize localization
  await initializeDateFormatting();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget  {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();}

class _MyAppState extends ConsumerState<MyApp> {


  @override
  Widget build(BuildContext context,) {
    final themeMode = ref.watch(themeProvider);

    return MaterialApp.router(
      title: 'Edumate',
     themeMode: themeMode,
       theme: AppTheme.lightTheme,
    darkTheme: AppTheme.darkTheme,
      routerConfig: GoRoutes.getRouter(false, ''),
    );
  }
}
// Theme.of(context).brightness == Brightness.light