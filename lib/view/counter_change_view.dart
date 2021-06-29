import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/providers.dart';

class CounterChangeView extends ConsumerWidget {
  const CounterChangeView({Key? key}) : super(key: key);
  static Route route() => MaterialPageRoute<void>(builder: (_) => CounterChangeView());

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    /// [Model sınıfı]: ChangeNotifier'dan kalıtım alan
    /// [watch (provider)]: Model sınıfının durumunu izler
    /// ve değiştiğinde UI rebuild edilir /yeniden oluşturulur.
    final _watch = watch(counterChangeProvider);

    /// [context.read<Model>.method()]: model sınıfındaki metotlara erişmek için
    final _read = context.read(counterChangeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ChangeNotifierProvider | Counter App',
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