import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'box_manager.dart';

class HiveManager {
  HiveManager() {
    /// [5] Açılan Kutuyu [ÇAĞIR]
    _boxCounter = Hive.box<int>(BoxManager.instance.boxNameCounter);
  }

  static Future init() async {
    /// [1] Initialize Hive - Hive Flutter'ı [BAŞLAT]
    await Hive.initFlutter();

    /// [2] Initialize Open Box - Kutu [AÇ]
    await Hive.openBox<int>(BoxManager.instance.boxNameCounter);
  }

  /// [3] Öncesinde açtığımız kutuyu çağırmak için oluşturduğumuz değişken
  late Box<int> _boxCounter;
  Box<int> get boxCounter => _boxCounter;

  /// [4] Değişimini izleyeceğimiz sayaç değişkeni
  int _counter = 0;
  int get counter => _counter;

  /// [6] Metotları Oluştur
  /// [6-A] Arttırma Metodu
  void incrementCounter() {
    /// Write Box - Kutuya [YAZ/KAYDET]
    /// Counter değerini bir arttır.
    _boxCounter.put(BoxManager.instance.keyNameCounter, (_counter++) + 1);
  }

  /// [6-B] Sıfırlama Metodu
  void resetCounter() {
    /// Sayaç zaten 0 ise [DEĞİŞİKLİK YAPMA]
    if (_counter == 0) return;

    /// Write Box - Kutuya [YAZ/KAYDET]
    /// Counter değerini sıfıra eşitle.
    _boxCounter.put(BoxManager.instance.keyNameCounter, _counter = 0);
  }

  /// [6-C] Azaltma Metodu
  void decrementCounter() {
    /// Write Box - Kutuya [YAZ/KAYDET]
    /// Counter değerini bir azalt.
    _boxCounter.put(BoxManager.instance.keyNameCounter, (_counter--) - 1);
  }

  /// [7] İşi biten Kutuyu [KAPAT]
  void close() {
    /// 1. Alternatif:
    /// Sadece [_boxCounter] isimli kutuyu kapatır
    _boxCounter.close();

    /// 2. Alternatif:
    /// Tüm Kutuluarı kapatır
    /// Hive.close();
  }
}
