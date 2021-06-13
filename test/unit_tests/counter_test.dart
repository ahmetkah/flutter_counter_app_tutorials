import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_counter_app_tutorials/counter.dart';

void main() {
  late Counter _counter;

  setUp(() {
    _counter = Counter();
  });

  tearDown(() {
    _counter;
  });

  group(
    'Counter Metotları',
    () {
      test(
        'Başlangıç: Sayaç değeri 0 olmalı.',
        () {
          /// [Actual]: Gerçekleşen
          /// - Kod tarafından üretilen değer
          /// - Test ettiğimiz değer
          final _left = _counter.value;

          /// [Matcher]: Eşleştirilecek
          /// - Eşit olmasını beklediğimiz değer
          final _right = 0;

          /// Doğrulama Bölümü
          /// [Expected]: Beklenen Değer => [Actual] ile [Matcher] karşılaştırır.a
          expect(_left, _right);

          /// Debug Console'da iki durum aşağıdaki gibi görüntülenir.
          /// Eşleşirse - Doğruysa [✓ description] test başarılı olur.
          /// Eşleşmezse Yanlışsa [✖ description]
          /// bir Exception atılarak test başarısız olur.
        },
      );

      test(
        'Arttırma (incrementCounter): Sayaç değeri 1 artmalı.',
        () {
          /// Arttırma Metodunu çalıştır
          _counter.incrementCounter();

          final _left = _counter.value;

          final _right = 1;

          expect(_left, _right);
        },
      );
      test(
        'Arttırma (decrementCounter): Sayaç değeri 1 azalmalı.',
        () {
          /// Azaltma Metodunu çalıştır
          _counter.decrementCounter();

          final _left = _counter.value;

          final _right = -1;

          expect(_left, _right);
        },
      );

      test(
        'Arttırma ve Sıfırlama: Sayaç değeri sıfırlanmalıdır',
        () {
          /// 1. Metodu çalıştır
          _counter.incrementCounter();

          /// 2. Metodu çalıştır
          _counter.resetCounter();

          final _left = _counter.value;

          final _right = 0;

          expect(_left, _right);
        },
      );

      test(
        'Arttırma, Sıfırlama, Azaltma ve Arttırma: Sayaç değeri 0 olmalıdır.',
        () {
          /// 1. Metodu çalıştır
          _counter.incrementCounter();

          /// 2. Metodu çalıştır
          _counter.resetCounter();

          /// 3. Metodu çalıştır
          _counter.decrementCounter();

          /// 4. Metodu çalıştır
          _counter.incrementCounter();

          final _left = _counter.value;

          final _right = 0;

          expect(_left, _right);
        },
      );
    },
  );
}
