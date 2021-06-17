import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_counter_app_tutorials/counter_stream.dart';

void main() {
  late CounterStream _counterStream;

  setUp(() {
    _counterStream = CounterStream(0);
  });

  tearDown(() {
    _counterStream.dispose();
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
          final _left = _counterStream.value;

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
          _counterStream.incrementCounter();

          final _left = _counterStream.value;

          final _right = 1;

          expect(_left, _right);
        },
      );
      test(
        'Arttırma (decrementCounter): Sayaç değeri 1 azalmalı.',
        () {
          /// Azaltma Metodunu çalıştır
          _counterStream.decrementCounter();

          final _left = _counterStream.value;

          final _right = -1;

          expect(_left, _right);
        },
      );

      test(
        'Arttırma ve Sıfırlama: Sayaç değeri sıfırlanmalıdır',
        () {
          /// 1. Metodu çalıştır
          _counterStream.incrementCounter();

          /// 2. Metodu çalıştır
          _counterStream.resetCounter();

          final _left = _counterStream.value;

          final _right = 0;

          expect(_left, _right);
        },
      );

      test(
        'Arttırma, Sıfırlama, Azaltma ve Arttırma: Sayaç değeri 0 olmalıdır.',
        () {
          /// 1. Metodu çalıştır
          _counterStream.incrementCounter();

          /// 2. Metodu çalıştır
          _counterStream.resetCounter();

          /// 3. Metodu çalıştır
          _counterStream.decrementCounter();

          /// 4. Metodu çalıştır
          _counterStream.incrementCounter();

          final _left = _counterStream.value;

          final _right = 0;

          expect(_left, _right);
        },
      );
    },
  );
}
