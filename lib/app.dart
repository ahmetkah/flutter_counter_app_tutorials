import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'middleware/counter_middleware.dart';
import 'models/counter_state.dart';
import 'reducers/counter_reducer.dart';
import 'view/counter_view.dart';

/// []: App sınıfını oluştur
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// []:
    final _store = Store<CounterState>(
      counterReducer,
      middleware: [
        CounterMiddleware(),
      ],
      initialState: CounterState(),
    );

    /// []:
    return StoreProvider<CounterState>(
      store: _store,
      child: MaterialApp(
        title: 'Flutter Counter App Tutorials',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        home: CounterView(),
      ),
    );
  }
}
