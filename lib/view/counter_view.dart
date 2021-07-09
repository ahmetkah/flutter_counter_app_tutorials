import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../actions/counter_actions.dart';
import '../models/counter_state.dart';
import '../viewmodels/counter_view_model.dart';

class CounterView extends StatelessWidget {
  const CounterView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// []:
    return StoreConnector<CounterState, CounterViewModel>(
      /// []:
      converter: (store) {
        /// []:
        return CounterViewModel(
          state: store.state,
          incrementCounter: () => store.dispatch(
            CounterActions.Increment,
          ),
          resetCounter: () => store.dispatch(
            CounterActions.ResetCounter,
          ),
          decrementCounter: () => store.dispatch(
            CounterActions.Decrement,
          ),
        );
      },
      builder: (BuildContext context, CounterViewModel model) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Flutter Redux | Counter App',
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
                  /// []:
                  /// Değişimi dinlenen değişkenin değerini ekrana yaz
                  '${model.state.counter}',
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
                  heroTag: 'resetTag',
                  backgroundColor: Colors.white,

                  /// [4-B]: Sıfırlama metodunu çalıştır
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

                  /// [4-C]: Azaltma metodunu çalıştır
                  onPressed: model.decrementCounter,
                  tooltip: 'Azalt',
                  child: Icon(
                    Icons.remove,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
