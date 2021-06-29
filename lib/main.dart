import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';

/// [7. Adım]: App widget'ini ProviderScope ile sarmala (wrap with widget ...).
void main() {
  runApp(
    ProviderScope(
      child: const App(),
    ),
  );
}
