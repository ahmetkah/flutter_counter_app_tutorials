import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'app.dart';
import 'counter_observer.dart';

/// [6. Adım]: main metodunu çalıştırma
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Initialize CounterBlocObserver
  /// CounterObserver'ı Başlatma
  Bloc.observer = CounterObserver();

  /// Initialize HydratedStorage
  /// HydratedStorage'ı Başlatma
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  runApp(
    const App(),
  );
}
