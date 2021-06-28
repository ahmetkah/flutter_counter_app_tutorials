import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'provider/counter_notifier.dart';

/// [6. Adım]: ChangeNotifierProvider’ı Konumlandırın
void main() {
  runApp(
    ChangeNotifierProvider<CounterNotifier>(
      create: (context) => CounterNotifier(),
      child: const App(),
    ),
  );
}
