import 'package:flutter/material.dart';

import 'app.dart';
import 'utils/hive_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// [0] Initialize HiveManager - HiveManager'ı [BAŞLAT]
  await HiveManager.init();

  runApp(
    const App(),
  );
}
