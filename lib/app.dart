import 'package:flutter/material.dart';
import 'package:flutter_counter_app_tutorials/counter_notifier.dart';

import 'counter_view.dart';

/// [5. Adım]: App sınıfını oluştur
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Counter App Tutorials',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),

      /// [5]
      home: CounterView(
        counter: CounterNotifier(),
      ),
    );
  }
}
