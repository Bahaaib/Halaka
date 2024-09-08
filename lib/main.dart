import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:halaka/presentation/global_bloc_observer.dart';
import 'package:logger/logger.dart';

import 'my_app.dart';

void main() {
  final _appLogger = Logger();
  Bloc.observer = GlobalBlocObserver(logger: _appLogger);
  runApp(const MyApp());
}
