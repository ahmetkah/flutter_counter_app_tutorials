import '../models/counter_state.dart';

class CounterViewModel {
  final CounterState state;
  final Function()? incrementCounter;
  final Function()? decrementCounter;
  final Function()? resetCounter;

  CounterViewModel({
    required this.state,
    this.incrementCounter,
    this.decrementCounter,
    this.resetCounter,
  });
}
