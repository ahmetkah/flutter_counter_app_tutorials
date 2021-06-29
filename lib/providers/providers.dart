import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../notifiers/counter_state_notifier.dart';
import '../notifiers/counter_change_notifier.dart';

/// [3. Adım]: CounterStateNotifier sınıfını çağıran
/// StateNotifierProvider için global bir değişken tanımla.
final counterStateProvider = StateNotifierProvider<CounterStateNotifier, int>(
  (ref) => CounterStateNotifier(),
);

/// [3. Adım]: CounterChangeNotifier sınıfını çağıran
/// ChnageNotifierProvider için global bir değişken tanımla.
final counterChangeProvider = ChangeNotifierProvider(
  (ref) => CounterChangeNotifier(),
);

///[3. Adım]: StateProvider için glabal bir değişken tanımla.
final counterProvider = StateProvider<int>(
  (ref) => 0,
);
