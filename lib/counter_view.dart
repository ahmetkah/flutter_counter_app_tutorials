import 'package:flutter/material.dart';

import 'counter_stream.dart';

class CounterView extends StatefulWidget {
  const CounterView({
    Key? key,
  }) : super(key: key);

  @override
  _CounterViewState createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  /// [1]
  late CounterRxDart _counterRxDart;

  @override
  void initState() {
    super.initState();

    /// [2]
    _counterRxDart = CounterRxDart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'RxDart Counter App',
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
            StreamBuilder<int>(

                /// [3]
                stream: _counterRxDart.valueStreamCounter,

                /// [4]
                initialData: _counterRxDart.value,
                builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                  return Text(
                    /// [5]: Sayacın değerini ekrana yaz
                    '${snapshot.data}',
                    style: Theme.of(context).textTheme.headline3,
                  );
                }),
          ],
        ),
      ),

      /// [6] Metotları Tetikleyecek/Çalıştıracak FAB Düğmelerini Oluştur
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              bottom: 10,
            ),

            /// [6-A]: Arttır FAB Düğmesi
            child: FloatingActionButton(
              heroTag: 'incrementTag',

              /// Arttırma metodunu [2-A] çalıştır
              onPressed: _counterRxDart.incrementCounter,
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

            /// [6-B]: Sıfırla FAB Düğmesi
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              heroTag: 'resetTag',

              /// Sıfırlama metodunu [2-B] çalıştır
              onPressed: _counterRxDart.resetCounter,
              tooltip: 'Sıfırla',
              child: Icon(
                Icons.exposure_zero_sharp,
                color: Colors.blue,
              ),
            ),
          ),

          /// [6-C]:Azalt FAB Düğmesi
          Padding(
            padding: EdgeInsets.only(
              bottom: 10,
            ),
            child: FloatingActionButton(
              heroTag: 'decrementTag',

              /// Azaltma metodunu [2-C] çalıştır
              onPressed: _counterRxDart.decrementCounter,
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

  @override
  void dispose() {
    /// [counterRxDart] ile işimiz bitince kapatılsın
    _counterRxDart.dispose();
    super.dispose();
  }
}
