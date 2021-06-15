/// [1]: BLoC Katmanı
/// [1-A]: Event Oluşturma

part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent extends Equatable {
  const CounterEvent();
  @override
  List<Object?> get props => [];
}

class IncrementEvent extends CounterEvent {}

class ResetEvent extends CounterEvent {}

class DecrementEvent extends CounterEvent {}
