import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/providers.dart';

class CounterStateProviderView extends ConsumerWidget {
  const CounterStateProviderView({Key? key}) : super(key: key);
  static Route route() => MaterialPageRoute<void>(builder: (_) => CounterStateProviderView());

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    /// [watch (provider)]:
    /// ve değiştiğinde UI rebuild edilir /yeniden oluşturulur.
    final _watch = watch(counterProvider);

    /// [context.read<Model>.method()]: state'e erişmek için
    final _read = context.read(counterProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'StateProvider | Counter App',
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
              '${_watch.state}',
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
              onPressed: () => _read.state++,
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
              onPressed: () {
                if (_read.state == 0) {
                  return;
                }
                _read.state = 0;
              },
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
              onPressed: () => _read.state--,
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
