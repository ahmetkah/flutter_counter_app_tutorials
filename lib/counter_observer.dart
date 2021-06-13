/// [7. Adım]
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class CounterObserver extends BlocObserver {
  /// Gerçekleşen tüm durum değişikliklerini görmek için
  /// yalnızca onTransition'u override ediyoruz
  @override
  void onTransition(Bloc bloc, Transition transition) {
    debugPrint('Counter onTransition $transition');
    super.onTransition(bloc, transition);
  }
}
