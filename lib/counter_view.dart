import 'package:flutter/material.dart';

import 'counter_notifier.dart';

class CounterView extends StatelessWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// [1]
    final _counter = CounterNotifier();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Value Notifier | Counter App',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Sayaç Değeri:',
              style: Theme.of(context).textTheme.headline3,
            ),

            /// [3-B]: [BlocBuilder] Text widgetini sararak [CounterCubit]'in
            /// durumu her değiştiğinde state'i rebuild eder.
            ValueListenableBuilder<int>(
              /// [valueListenable] parametresine
              /// [_counter] değişkenini dinlemesini istedik.
              valueListenable: _counter,
              builder: (context, counter, widget) {
                return Text(
                  /// Değişimi dinlenen değişkenin değerini ekrana yaz
                  '$counter',
                  style: Theme.of(context).textTheme.headline3,
                );
              },
            ),
          ],
        ),
      ),

      /// FAB Düğmelerini Oluşturma
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              bottom: 10,
            ),

            /// Arttır FAB Düğmesi
            child: FloatingActionButton(
              heroTag: 'incrementTag',

              /// [3-D]: Arttırma metodunu çalıştır
              onPressed: _counter.incrementCounter,
              tooltip: 'Arttır',
              child: Icon(
                Icons.add,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: 10,
            ),

            /// Sıfırla FAB Düğmesi
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              heroTag: 'resetTag',

              /// [3-E]: Sıfırlama metodunu çalıştır
              onPressed: _counter.resetCounter,
              tooltip: 'Sıfırla',
              child: Icon(
                Icons.exposure_zero_sharp,
                color: Colors.blue,
              ),
            ),
          ),

          /// Azalt FAB Düğmesi
          Padding(
            padding: EdgeInsets.only(
              bottom: 10,
            ),
            child: FloatingActionButton(
              heroTag: 'decrementTag',

              /// [3-F]: Azaltma metodunu çalıştır
              onPressed: _counter.decrementCounter,
              tooltip: 'Azalt',
              child: Icon(
                Icons.remove,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
