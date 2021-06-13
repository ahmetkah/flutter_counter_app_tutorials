import 'package:flutter/material.dart';

class Counter {
  /// [1] Sayaçta değişimini izleyeceğimiz değişkeni tanımla
  /// ve bir başlangıç değeri ver.
  int _value = 0;
  int get value => _value;

  /// [2] Kullanacağımız Metotları Oluştur
  /// [2-A]: Arttırma
  void incrementCounter() {
    /// Sayacı bir [ARTIR]
    _value++;
    debugPrint('Arttırma metodu çalıştı');
  }

  /// [2-B]: Sıfırlama
  void resetCounter() {
    /// Sayaç zaten 0 ise [DEĞİŞİKLİK YAPMA]
    if (_value == 0) return;

    /// Sayaca [0] değerini ata
    _value = 0;
    debugPrint('Sıfırla metodu çalıştı');
  }

  /// [2-C]: Azaltma
  void decrementCounter() {
    /// Sayacı bir [AZALT]
    _value--;
    debugPrint('Azaltma metodu çalıştı');
  }
}
