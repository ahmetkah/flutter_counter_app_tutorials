/// [1. Adım]: BLoC Katmanı
/// [1-C] BLoC Oluşturma
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  /// State için başlangıç değeri
  /// super(state) => state(0)
  CounterBloc() : super(CounterState(counter: 0)) {
    /// state değerini 1 arttır
    on<IncrementEvent>(
      (event, emit) => emit(
        CounterState(counter: state.counter + 1),
      ),
    );

    /// state değerini sıfırla
    on<ResetEvent>(
      (event, emit) => emit(
        CounterState(counter: 0),
      ),
    );

    /// state değerini 1 azalt
    on<DecrementEvent>(
      (event, emit) => emit(
        CounterState(counter: state.counter - 1),
      ),
    );
  }
}
