import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'counter_view.dart';

class App extends HookWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Counter App Tutorials',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: CounterView(),
    );
  }
}
