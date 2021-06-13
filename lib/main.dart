/// [8. Adım]
///
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'counter_observer.dart';

Future<void> main() async {
  /// Initialize CounterBlocObserver
  /// CounterBlocObserver'ı Başlatma
  Bloc.observer = CounterObserver();
  runApp(
    const App(),
  );
}
