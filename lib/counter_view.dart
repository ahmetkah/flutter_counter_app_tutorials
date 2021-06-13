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
  late CounterStream _counterStream;

  @override
  void initState() {
    super.initState();

    /// [2]
    _counterStream = CounterStream(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Stream Counter App',
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
                stream: _counterStream.streamCounter,

                /// [4]
                initialData: _counterStream.value,
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
              onPressed: _counterStream.incrementCounter,
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
              onPressed: _counterStream.resetCounter,
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
              onPressed: _counterStream.decrementCounter,
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
    /// [7]
    _counterStream.dispose();
    super.dispose();
  }
}
