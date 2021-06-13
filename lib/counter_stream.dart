import 'dart:async';

import 'package:flutter/material.dart';

class CounterStream {
  /// [1] Sayaçta değişimini izleyeceğimiz değişkeni tanımla
  int _value;
  int get value => _value;

  /// [2] StreamController tanımla
  StreamController<int>? _streamController;

  /// [3] Kurucu (Constructor) metot içinde başlangıç değerini al
  CounterStream(this._value) {
    /// Oluşturulan StreamController'ın [stream]'ini (akışını) dinlemeye başla
    _streamController = StreamController<int>.broadcast();
  }

  /// [4] StreamController'ın [stream]'ine ulaş
  /// Veri akışının olduğu yer
  Stream<int>? get streamCounter => _streamController?.stream;

  /// [2] Kullanacağımız Metotları Oluştur
  /// [2-A]: Arttırma
  void incrementCounter() {
    /// Sayacı bir [ARTIR]
    _value++;

    /// Veri akışına değişen veriyi ekle
    _streamController?.sink.add(_value);
    debugPrint('Arttırma metodu çalıştı');
  }

  /// [2-B]: Sıfırlama
  void resetCounter() {
    /// Sayaç zaten 0 ise [DEĞİŞİKLİK YAPMA]
    if (_value == 0) return;

    /// Sayaca [0] değerini ata
    _value = 0;
    _streamController?.sink.add(_value);
    debugPrint('Sıfırla metodu çalıştı');
  }

  /// [2-C]: Azaltma
  void decrementCounter() {
    /// Sayacı bir [AZALT]
    _value--;
    _streamController?.sink.add(_value);
    debugPrint('Azaltma metodu çalıştı');
  }

  /// [3] StreamController ile işimiz bitince kapatılsın
  void dispose() {
    _streamController?.close();
  }
}
