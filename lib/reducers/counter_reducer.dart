import 'package:redux/redux.dart';

import '../actions/counter_actions.dart';
import '../models/counter_state.dart';

final counterReducer = combineReducers<CounterState>([
  TypedReducer<CounterState, CounterActions>(setCounter),
  TypedReducer<CounterState, CounterActions>(resetCounter),
]);

CounterState setCounter(CounterState state, CounterActions action) {
  if (action == CounterActions.Increment) {
    state.counter++;
    return state;
  } else if (action == CounterActions.Decrement) {
    state.counter--;
    return state;
  }

  return state;
}

CounterState resetCounter(CounterState state, CounterActions action) {
  if (action == CounterActions.ResetCounter) {
    state.counter = 0;
    return state;
  }

  return state;
}
