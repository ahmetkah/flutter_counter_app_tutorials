import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../notifiers/counter_state_notifier.dart';

/// [3. Adım]: CounterNotifier sınıfını çağıran
/// StateNotifierProvider için global bir değişken tanımla.
final counterProvider = StateNotifierProvider<CounterStateNotifier, int>(
  (ref) => CounterStateNotifier(),
);
