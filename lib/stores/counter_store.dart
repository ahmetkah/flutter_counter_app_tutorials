import 'package:mobx/mobx.dart';

/// Oluşturulacak dosyanın ismi
part 'counter_store.g.dart';

///
class CounterStore = _CounterStoreBase with _$CounterStore;

abstract class _CounterStoreBase with Store {
  /// [1] Değişimini dinleyeceğimiz değişken
  /// @observable: sayfadaki değişiklikleri değerlendirip,gözlemlendirebilir hale getirir.
  @observable
  int counter = 0;

  /// [1] Metotları Oluştur: Arttırma, Sıfırlama ve Azaltma
  /// [1-A]: Arttırma Metodu
  /// @action: değişkenleri değiştirmemizi sağlar.
  @action
  void incrementCounter() => counter++;

  /// [1-B]: Sıfırlama Metodu
  @action
  void resetCounter() {
    /// Sayaç zaten 0 ise [DEĞİŞİKLİK YAPMA]
    if (counter == 0) return;

    /// Sayaca [0] değerini ata
    counter = 0;
  }

  /// [1-C]: Azaltma Metodu
  @action
  void decrementCounter() => counter--;
}
