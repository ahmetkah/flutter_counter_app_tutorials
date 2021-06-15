/// [8. Adım]

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'counter_observer.dart';

/// [6. Adım]: main metodunu çalıştırma
void main() {
  /// Initialize CounterBlocObserver
  /// CounterObserver'ı Başlatma
  Bloc.observer = CounterObserver();
  runApp(
    const App(),
  );
}
