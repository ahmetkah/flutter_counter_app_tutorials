/// [5. Adım]

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_view.dart';
import '../bloc/counter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///
    return BlocProvider<CounterBloc>(
      create: (context) => CounterBloc(),
      child: CounterView(),
    );
  }
}
