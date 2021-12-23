import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'app.dart';
import 'counter_observer.dart';

/// [6. Adım]: main metodunu çalıştırma
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Initialize CounterBlocObserver
  /// CounterObserver'ı Başlatma
  BlocOverrides.runZoned(
    () {},
    blocObserver: CounterObserver(),
  );

  final storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );

  /// Initialize HydratedStorage
  /// HydratedStorage'ı Başlatma
  HydratedBlocOverrides.runZoned(
    () => runApp(
      const App(),
    ),
    storage: storage,
  );
}
