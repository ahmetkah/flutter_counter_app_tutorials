import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_view.dart';
import '../bloc/counter_bloc.dart';

/// [2. Adım]: BlocProvider'ı Konumlandırma
class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// [2-A]: BlocProvider'ı widget ağacımıza enjekte ettik.
    return BlocProvider<CounterBloc>(
      /// BlocProvider’ın <type>’ında ve create parametresinede yer alan
      /// [CounterBloc] Bloc’dan kalıtım alan sınıftır.
      /// [2-B]: create parametresinde yeni bir [CounterBloc] nesnesi oluşturulacak
      create: (_) => CounterBloc(),

      /// [2-C]: [CounterView]’ın altındaki tüm widgetlerden enjekte ettiğimiz
      /// [CounterBloc] nesnesine ulaşabileceğiz.
      child: CounterView(),
    );
  }
}
