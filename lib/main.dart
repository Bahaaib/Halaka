import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:halaka/presentation/global_bloc_observer.dart';
import 'package:logger/logger.dart';
import 'firebase_options.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final _appLogger = Logger();
  Bloc.observer = GlobalBlocObserver(logger: _appLogger);
  runApp(const MyApp());
}
