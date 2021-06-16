import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../model/counter_model.dart';

class CounterView extends StatelessWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Değişimini dinleyeceğimiz değişkene erişim için
    /// [rebuildOnChange: true]: Rebuild için
    final _watch = ScopedModel.of<CounterModel>(context, rebuildOnChange: true);

    /// Metotlara erişim için
    /// [rebuildOnChange: false]: Rebuild olmaması için
    final _read = ScopedModel.of<CounterModel>(context, rebuildOnChange: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Scoped Model | Counter App',
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
            Text(
              /// Değişimi dinlenen değişkenin değerini ekrana yaz
              '${_watch.counter}',
              style: Theme.of(context).textTheme.headline3,
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
              onPressed: _read.incrementCounter,
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
              onPressed: _read.resetCounter,
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
              onPressed: _read.decrementCounter,
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
