/// [2]

part of 'counter_bloc.dart';

@immutable
class CounterState extends Equatable {
  const CounterState({required this.counter});

  final int counter;

  @override
  List<Object?> get props => [counter];
}
