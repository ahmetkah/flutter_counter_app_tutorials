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
  CounterBloc() : super(CounterState(counter: 0)) {
    hydrate();
  }

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

  /// [Oku/Getir]
  /// Son [state]'i JSON'dan CounterState'e çevirir
  @override
  CounterState? fromJson(Map<String, dynamic> json) => CounterState(counter: json['value'] as int);

  /// [Yaz/Kaydet]
  /// Güncellenen [state]'i JSON'a çevirir.
  @override
  Map<String, dynamic>? toJson(CounterState state) => {'value': state.counter};
}
