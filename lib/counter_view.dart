import 'package:flutter/material.dart';

import 'counter_notifier.dart';

class CounterView extends StatelessWidget {
  const CounterView({Key? key, required this.counter}) : super(key: key);

  /// [2]
  final CounterNotifier counter;

  @override
  Widget build(BuildContext context) {
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

            /// [3-A]: [ValueListenableBuilder Text widgetini sararak
            /// [CounterNotifier]'in durumu her değiştiğinde value'yı rebuild eder.
            ValueListenableBuilder<int>(
              /// [3-B]: [valueListenable] parametresine
              /// [counter] değişkenini dinlemesini istedik.
              valueListenable: counter,
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

      /// [4] FAB Düğmelerini Oluşturma
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

              /// [4-A]: Arttırma metodunu çalıştır
              onPressed: counter.incrementCounter,
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

              /// [4-B]: Sıfırlama metodunu çalıştır
              onPressed: counter.resetCounter,
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

              /// [4-C]: Azaltma metodunu çalıştır
              onPressed: counter.decrementCounter,
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
