/// [1. Adım]:
import 'package:bloc/bloc.dart';

/// Sınıfı Cubit'ten extends et.
class CounterCubit extends Cubit<int> {
  /// State için başlangıç değeri
  /// super(state) => state(0)
  CounterCubit() : super(0);

  /// [1]: Arttır metodunun çalıştıktan sonra
  /// [state] güncellenmesi için
  /// [emit] metodunu kullan
  void incrementCounter() => emit(state + 1);

  /// [2]: Sıfırlama metodunun çalıştıktan sonra
  /// [state] güncellenmesi için
  /// [emit] metodunu kullan
  void resetCounter() => emit(0);

  /// [3]: Azalt metodunun çalıştıktan sonra
  /// [state] güncellenmesi için
  /// [emit] metodunu kullan
  void decrementCounter() => emit(state - 1);
}


/*
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  /// State için başlangıç değeri
  /// super(state) => state(0)
  CounterBloc() : super(CounterState(counter: 0));

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is IncrementEvent) {
      /// state değerini 1 arttır
      yield CounterState(counter: state.counter + 1);
    } else if (event is ResetEvent) {
      /// state değerini sıfırla
      yield CounterState(counter: 0);
    } else if (event is DecrementEvent) {
      /// state değerini 1 azalt
      yield CounterState(counter: state.counter - 1);
    }
  }
}
*/