import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class CounterRxDart {
  /// [1] Sayaçta değişimini izleyeceğimiz değişkeni tanımla
  int _value = 0;
  int get value => _value;

  /// [2] BehaviorSubject tanımla
  BehaviorSubject<int>? _behaviorSubject;

  /// [3] Kurucu (Constructor) metot
  CounterRxDart() {
    /// Oluşturulan BehaviorSubject'ın [stream]'ini (akışını) dinlemeye başla
    _behaviorSubject = BehaviorSubject<int>.seeded(_value);
  }

  /// [4] Observable: Verilerin yayınlandığı yer
  ValueStream<int>? get valueStreamCounter => _behaviorSubject?.stream;

  /// [2] Kullanacağımız Metotları Oluştur
  /// [2-A]: Arttırma
  void incrementCounter() {
    /// Sayacı bir [ARTIR]
    _value++;

    /// Veri akışına değişen veriyi ekle
    _behaviorSubject?.sink.add(_value);
    debugPrint('Arttırma metodu çalıştı');
  }

  /// [2-B]: Sıfırlama
  void resetCounter() {
    /// Sayaç zaten 0 ise [DEĞİŞİKLİK YAPMA]
    if (_value == 0) return;

    /// Sayaca [0] değerini ata
    _value = 0;
    _behaviorSubject?.sink.add(_value);
    debugPrint('Sıfırla metodu çalıştı');
  }

  /// [2-C]: Azaltma
  void decrementCounter() {
    /// Sayacı bir [AZALT]
    _value--;
    _behaviorSubject?.sink.add(_value);
    debugPrint('Azaltma metodu çalıştı');
  }

  /// [3] BehaviorSubject ile işimiz bitince kapatılsın
  void dispose() {
    _behaviorSubject?.close();
  }
}
