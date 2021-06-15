import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/counter_cubit.dart';

/// [3. Adım]: Presentation Katmanı
class CounterView extends StatelessWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// [3-A]: Değişimini dinleyeceğimiz Cubit nesnesine erişim için
    /// Bu metot ile CounterCubit sınıfında yer alan state değerine erişebileceğiz
    final _read = BlocProvider.of<CounterCubit>(context);
    // Erişim için 2. alternatif
    // final _read = context.read<CounterCubit>();
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

            /// [3-B]: [BlocBuilder] Text widgetini sararak [CounterCubit]'in
            /// durumu her değiştiğinde state'i rebuild eder.
            BlocBuilder<CounterCubit, int>(
              builder: (BuildContext context, int state) {
                return Text(
                  /// [3-C]: state değerini ekrana yaz
                  '$state',
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

              /// [3-E]: Sıfırlama metodunu çalıştır
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

              /// [3-F]: Azaltma metodunu çalıştır
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
