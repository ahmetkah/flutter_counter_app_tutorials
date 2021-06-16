import 'package:flutter/material.dart';

/// Sınıfı [ValueNotifier]'dan kalıtım al.
class CounterNotifier extends ValueNotifier<int> {
  /// Value için başlangıç değeri ver
  /// super(value) => state(0)
  CounterNotifier() : super(0);

  /// [1] Metotları Oluştur: Arttırma, Sıfırlama ve Azaltma
  /// [1-A]: Arttırma Metodu
  void incrementCounter() {
    /// Value (Sayaç) değerini bir [ARTTIR]
    value++;
    debugPrint('Arttırma metodu');
  }

  /// [1-B]: Sıfırlama Metodu
  void resetCounter() {
    /// Value zaten 0 ise [DEĞİŞİKLİK YAPMA]
    if (value == 0) return;

    /// Value değerine [0] ata
    value = 0;
    debugPrint('Sıfırla metodu');
  }

  /// [1-C]: Azaltma Metodu
  void decrementCounter() {
    /// Value değerini bir [AZALT]
    value--;
    debugPrint('Azaltma metodu');
  }
}
