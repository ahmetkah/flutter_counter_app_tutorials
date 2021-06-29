import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Sınıfı [StateNotifier]'dan kalıtım al.
class CounterStateNotifier extends StateNotifier<int> {
  CounterStateNotifier() : super(0);

  /// [1] Metotları Oluştur: Arttırma, Sıfırlama ve Azaltma
  /// [1-A]: Arttırma Metodu
  void incrementCounter() => state++;

  /// [1-B]: Sıfırlama Metodu
  void resetCounter() {
    /// Sayaç zaten 0 ise [DEĞİŞİKLİK YAPMA]
    if (state == 0) return;

    /// Sayaca [0] değerini ata
    state = 0;
  }

  /// [1-C]: Azaltma Metodu
  void decrementCounter() => state--;
}
