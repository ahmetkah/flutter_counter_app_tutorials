import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'app.dart';
import 'model/counter_model.dart';

/// [6. Adım]: ScopedModel’i Konumlandırın
void main() {
  runApp(
    ScopedModel<CounterModel>(
      model: CounterModel(),
      child: const App(),
    ),
  );
}
