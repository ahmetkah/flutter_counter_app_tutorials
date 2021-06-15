/// [2. Adım]: BlocProvider'ı Konumlandırma

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/counter_cubit.dart';

import 'counter_view.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// BlocProvider'ı widget ağacımıza enjekte ettik.
    return BlocProvider<CounterCubit>(
      /// BlocProvider’ın <type>’ında ve create parametresinede yer alan
      /// [CounterCubit] Cubit’ten kalıtım alan sınıftır.
      /// create parametresinde yeni bir [CounterCubit] nesnesi oluşturulacak
      create: (_) => CounterCubit(),

      /// [CounterView]’ın altındaki tüm widgetlerden enjekte ettiğimiz
      /// [CounterCubit] nesnesine ulaşabileceğiz.
      child: CounterView(),
    );
  }
}
