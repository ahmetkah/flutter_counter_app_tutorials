/// [7. Adım]
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class CounterObserver extends BlocObserver {
  /// Gerçekleşen tüm durum değişikliklerini görmek için
  /// yalnızca onChange'i override ediyoruz
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugPrint('Counter onChange $change');
  }
}
