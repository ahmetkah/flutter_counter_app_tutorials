import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// [0] Initialize Firebase - Firebase'i [BAŞLAT]
  await Firebase.initializeApp();

  runApp(
    const App(),
  );
}
