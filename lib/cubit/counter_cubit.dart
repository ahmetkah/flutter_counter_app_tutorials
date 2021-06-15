/// [1. Adım]: BLoC/Cubit Katmanı Oluşturma
import 'package:bloc/bloc.dart';

/// Sınıfı Cubit'ten extends et.
class CounterCubit extends Cubit<int> {
  /// State için başlangıç değeri
  /// super(state) => state(0)
  CounterCubit() : super(0);

  /// [1-A]: Arttır metodunun çalıştıktan sonra
  /// [state] güncellenmesi için
  /// [emit] metodunu kullan
  void incrementCounter() => emit(state + 1);

  /// [1-B]: Sıfırlama metodunun çalıştıktan sonra
  /// [state] güncellenmesi için
  /// [emit] metodunu kullan
  void resetCounter() => emit(0);

  /// [2-B]: Azalt metodunun çalıştıktan sonra
  /// [state] güncellenmesi için
  /// [emit] metodunu kullan
  void decrementCounter() => emit(state - 1);
}
