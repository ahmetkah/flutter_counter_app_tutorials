import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter_bloc.dart';

/// [3. Adım]: Presentation Katmanı
class CounterView extends StatelessWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// [3-A]: Değişimini dinleyeceğimiz Bloc nesnesine erişim için
    /// Bu metot ile CounterBloc sınıfında yer alan state değerine erişebileceğiz
    final _read = BlocProvider.of<CounterBloc>(context);
    // Erişim için 2. alternatif
    // final _read = context.read<CounterBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter BLoC Counter App',
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

            /// [3-B]: [BlocBuilder] Text widgetini sararak [CounterBloc]'un
            /// durumu her değiştiğinde state'i rebuild eder.
            BlocBuilder<CounterBloc, CounterState>(
              builder: (BuildContext context, CounterState state) {
                return Text(
                  /// [3-B]: state'in içindeki sayacın counter değerini ekrana yaz
                  '${state.counter}',
                  style: Theme.of(context).textTheme.headline3,
                );
              },
            ),
          ],
        ),
      ),

      /// [3-C]: CounterBloc yapımıza gönderilecek
      /// (CounterState'i tetikleyecek) olan
      /// Eventler için FAB Düğmelerini Oluşturma
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

              /// [3-D]: Arttırma Event'ini CounterBloc'a gönder
              onPressed: () => _read.add(IncrementEvent()),
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

              /// [3-E] Sıfırlama Event'ini CounterBloc'a gönder
              onPressed: () => _read.add(ResetEvent()),
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

              /// [3-F] Azaltma Event'ini CounterBloc'a gönder
              onPressed: () => _read.add(DecrementEvent()),
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
