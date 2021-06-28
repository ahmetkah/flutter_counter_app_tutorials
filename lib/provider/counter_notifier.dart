import 'package:flutter/foundation.dart';

/// Sınıfı [ChangeNotifier]'dan kalıtım al.
class CounterNotifier extends ChangeNotifier {
  /// Değişimini dinleyeceğimiz değişkeni oluştur.
  /// ve başlangıç değeri olarak 0 ata.
  int _counter = 0;

  /// Getter: Sayıyı [OKU/GETİR]
  int get counter => _counter;

  /// [1] Metotları Oluştur: Arttırma, Sıfırlama ve Azaltma
  /// [1-A]: Arttırma Metodu
  void incrementCounter() {
    /// [Önce] Sayacı bir [ARTIR]
    _counter++;
    // [Sonra] Tüm dinleyicilere [BİLDİR]
    notifyListeners();
  }

  /// [1-B]: Sıfırlama Metodu
  void resetCounter() {
    /// Sayaç zaten 0 ise [DEĞİŞİKLİK YAPMA]
    if (_counter == 0) return;

    /// Sayaca [0] değerini ata
    _counter = 0;
    notifyListeners();
  }

  /// [1-C]: Azaltma Metodu
  void decrementCounter() {
    /// [Önce] Sayacı bir [AZALT]
    _counter--;
    notifyListeners();
  }
}
