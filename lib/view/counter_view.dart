import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../view_model/counter_view_model.dart';

class CounterView extends StatelessWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// [2]: [ViewModelBuilder]
    return ViewModelBuilder<CounterViewModel>.reactive(
      viewModelBuilder: () => CounterViewModel(),

      /// [model]: CounterViewModel sınıfında yer alan
      /// state değerine ve metotlara erişebileceğiz
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Stacked | Counter App',
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
                '${model.counter}',
                style: Theme.of(context).textTheme.headline3,
              ),
            ],
          ),
        ),

        /// [3] FAB Düğmelerini Oluşturma
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

                /// [3-A]: Arttırma metodunu çalıştır
                onPressed: model.incrementCounter,
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

                /// [3-B]: Sıfırlama metodunu çalıştır
                onPressed: model.resetCounter,
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

                /// [3-C]: Azaltma metodunu çalıştır
                onPressed: model.decrementCounter,
                tooltip: 'Azalt',
                child: Icon(
                  Icons.remove,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
