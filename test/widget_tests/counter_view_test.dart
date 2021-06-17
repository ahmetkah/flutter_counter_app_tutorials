import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_counter_app_tutorials/app.dart';
import 'package:flutter_counter_app_tutorials/counter_view.dart';
import 'package:flutter_counter_app_tutorials/counter_notifier.dart';

Widget createCounterView() => MaterialApp(
      home: CounterView(
        counter: CounterNotifier(),
      ),
    );

void main() {
  group('Counter View Widget Tests |', () {
    testWidgets(
      'Sayaç Arttırma Testi',
      (WidgetTester tester) async {
        /// [pumpWidget]: Test edilecek Widget'ı oluşturur.
        /// Yani widget ağacına ekler ve build() metodunu çağırır.
        await tester.pumpWidget(const App());

        /// 2. Alternatif:
        ///  await tester.pumpWidget(createCounterView());

        /// Find Fonksiyonu: Ara ve Bul
        /// [find.text()]: Text widgetlerini bulmamızı sağlar.
        /// [find.byIcon()]: Icon widgetlerini bulmamızı sağlar.
        // Ekranda '0' içeren text widgetini arar
        final _finder0 = find.text('0');
        // Ekranda '1' içeren text widgetini arar
        final _finder1 = find.text('1');
        // Ekranda 'Add' ikon widgetini arar
        final _finderIconAdd = find.byIcon(Icons.add);

        /// [findsOneWidget]: Ekranda o widgetın olduğunu doğrular.
        expect(_finder0, findsOneWidget);

        /// [findsNothing]: Ekranda o widget'ın olmadığını doğrular.
        expect(_finder1, findsNothing);

        /// Widget Etkileşimleri: Widget'la etkileşime girer.
        /// [tap()]: Bir widgete tıklanma/basma davranışını taklit eder.
        await tester.tap(_finderIconAdd);

        /// Rebuild:
        /// [pump()]: Widget’ın re-build edilmesini sağlar.
        await tester.pump();

        /// [pumpAndSettle]: Widget’ın animasyonlar bittikten sonra
        /// re-build edilmesini sağlar.
        /// await tester.pumpAndSettle(const Duration(seconds: 1));

        /// Ekranda sayaç değerinin "0" olmadığını doğruluyoruz
        expect(_finder0, findsNothing);

        /// Ekranda sayaç değerinin "1" olduğunu doğruluyoruz
        expect(_finder1, findsOneWidget);
      },
    );

    testWidgets(
      'Sayaç Sıfırlama Testi',
      (WidgetTester tester) async {
        await tester.pumpWidget(const App());

        final _finder0 = find.text('0');
        final _finder1 = find.text('1');
        final _finder2 = find.text('2');
        final _finderIconAdd = find.byIcon(Icons.add);
        final _finderIconZero = find.byIcon(Icons.exposure_zero_sharp);
        //
        expect(_finder0, findsOneWidget);
        //
        expect(_finder1, findsNothing);
        //
        expect(_finder2, findsNothing);

        await tester.tap(_finderIconAdd);
        await tester.tap(_finderIconAdd);
        await tester.tap(_finderIconZero);

        await tester.pump();

        expect(_finder2, findsNothing);

        expect(_finder0, findsOneWidget);
      },
    );

    testWidgets(
      'Sayaç Azaltma Testi',
      (WidgetTester tester) async {
        await tester.pumpWidget(createCounterView());

        final _finder0 = find.text('0');
        final _finderMinus1 = find.text('-1');
        final _finderIconRemove = find.byIcon(Icons.remove);

        expect(_finder0, findsOneWidget);

        expect(_finderMinus1, findsNothing);

        await tester.tap(_finderIconRemove);

        await tester.pump();

        expect(_finder0, findsNothing);

        expect(_finderMinus1, findsOneWidget);
      },
    );
  });
}

/// Emülatör üzerinden testi takip etmek
/// flutter run test/widget_tests/counter_view_test.dart