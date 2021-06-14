import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/counter_cubit.dart';

class CounterView extends StatelessWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final _read = context.read<CounterCubit>();
    final _read = BlocProvider.of<CounterCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter BLoC-Cubit | Counter App',
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

            /// [BlocBuilder], CounterCubit'in durumu her değiştiğinde
            /// Text widgetini sararak state'i günceller.
            BlocBuilder<CounterCubit, int>(
              builder: (BuildContext context, int state) {
                return Text(
                  /// [5]: Sayacın değerini ekrana yaz
                  '$state',
                  style: Theme.of(context).textTheme.headline3,
                );
              },
            ),
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

              /// Arttırma Event'ini tetikle
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

            /// [6-B]: Sıfırla FAB Düğmesi
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              heroTag: 'resetTag',

              /// Sıfırlama metodunu [2-B] çalıştır
              onPressed: _read.resetCounter,
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
