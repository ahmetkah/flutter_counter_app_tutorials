class BoxManager {
  /// Lazy Singleton
  static BoxManager? _instance;
  static BoxManager get instance {
    _instance ??= BoxManager._init();
    return _instance!;
  }

  BoxManager._init();

  /// Açacağımız [KUTU ADI]
  final boxNameCounter = 'counterBox';

  /// Kutuya [YAZ/KAYDET] ve Kutudan [OKU/GETİR] için
  /// Kullanacağımız [ANAHTAR ADI]
  final keyNameCounter = 'counterKey';
}
