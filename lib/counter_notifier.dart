import 'package:flutter/material.dart';

class CounterNotifier extends ValueNotifier<int> {
  CounterNotifier() : super(0);

  /// [] Metotları Oluştur
  /// Arttırma, Sıfırlama ve Azaltma
  void incrementCounter() {
    /// Sayacı bir [ARTIR]
    value++;
    debugPrint('Arttırma metodu');
  }

  void resetCounter() {
    /// Sayaç zaten 0 ise [DEĞİŞİKLİK YAPMA]
    if (value == 0) return;

    /// Sayaca [0] değerini ata
    value = 0;
    debugPrint('Sıfırla metodu');
  }

  void decrementCounter() {
    /// Sayacı bir [AZALT]
    value--;
    debugPrint('Azaltma metodu');
  }
}
