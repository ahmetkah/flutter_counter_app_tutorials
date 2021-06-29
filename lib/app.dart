import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'view/counter_view.dart';

/// [5. Adım]: App sınıfını oluştur
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// GetMaterialApp ile sar
    return GetMaterialApp(
      title: 'Flutter Counter App Tutorials',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const CounterView(),
    );
  }
}
