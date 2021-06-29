import 'package:get/get.dart';

/// Sınıfı [GetxController]'dan kalıtım al.
class CounterControllers extends GetxController {
  /// [1] Değişken
  final _counter = 0.obs;

  /// [2] Getter
  int get counter => _counter.value;

  /// [1] Metotları Oluştur: Arttırma, Sıfırlama ve Azaltma
  /// [1-A]: Arttırma Metodu
  void incrementCounter() => _counter.value++;

  /// [1-B]: Sıfırlama Metodu
  void resetCounter() {
    /// Sayaç zaten 0 ise [DEĞİŞİKLİK YAPMA]
    if (_counter.value == 0) return;

    /// Sayaca [0] değerini ata
    _counter.value = 0;
  }

  /// [1-C]: Azaltma Metodu
  void decrementCounter() => _counter.value--;
}
