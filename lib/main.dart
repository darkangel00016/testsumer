import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'common/injector/injector_config.dart';
import 'common/utils/app_bloc_observer.dart';
import 'presentation/app.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  InjectorConfig.setup();
  runApp(const App());
}