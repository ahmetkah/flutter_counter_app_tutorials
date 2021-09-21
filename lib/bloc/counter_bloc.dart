/// [1. Adım]: BLoC Katmanı
/// [1-C] BLoC Oluşturma
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> with HydratedMixin {
  /// State için başlangıç değeri
  /// super(state) => state(0)
  CounterBloc() : super(const CounterState(counter: 0)) {
    hydrate();

    /// state değerini 1 arttır
    on<IncrementEvent>(
      (event, emit) => emit(
        CounterState(counter: state.counter + 1),
      ),
    );

    /// state değerini sıfırla
    on<ResetEvent>(
      (event, emit) => emit(
        const CounterState(counter: 0),
      ),
    );

    /// state değerini 1 azalt
    on<DecrementEvent>(
      (event, emit) => emit(
        CounterState(counter: state.counter - 1),
      ),
    );
  }

  /// [Oku/Getir]
  /// Son [state]'i JSON'dan CounterState'e çevirir
  @override
  CounterState? fromJson(Map<String, dynamic> json) =>
      CounterState(counter: json['value'] as int);

  /// [Yaz/Kaydet]
  /// Güncellenen [state]'i JSON'a çevirir.
  @override
  Map<String, dynamic>? toJson(CounterState state) => {'value': state.counter};
}
