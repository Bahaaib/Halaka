import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:halaka/presentation/dummy/cubits/dummy_cubit/dummy_cubit.dart';
import 'package:halaka/resources/themes.dart';
import 'package:halaka/routing/main_router.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _appRouter = AppRouter();

  @override
  void initState() {
    _injectDependencies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("fa", "IR"),
      ],
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
      theme: AppThemes.englishAppTheme,
      builder: (_, widget) => widget ?? Container(),
    );
  }

  void _injectDependencies() {
    GetIt.instance.registerLazySingleton(() => DummyCubit());
    GetIt.instance.registerLazySingleton(() => _appRouter);
    GetIt.instance.registerLazySingleton<Dio>(() => Dio());
  }

  @override
  void dispose() {
    GetIt.instance.reset();
    super.dispose();
  }
}
