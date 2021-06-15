import 'package:flutter/material.dart';

import 'view/counter_page.dart';

/// [5. Adım]: App sınıfını oluştur
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Counter App Tutorials',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: const CounterPage(),
    );
  }
}
