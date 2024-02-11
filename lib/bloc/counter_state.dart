part of 'counter_bloc.dart';

abstract class CounterState extends Equatable {
  const CounterState();
}

class CounterInitial extends CounterState {
  int counter;
  CounterInitial({required this.counter});
  @override
  List<Object> get props => [counter];
}
class CounterUpdate extends CounterState {
  int counter;
  CounterUpdate({required this.counter});
  @override
  List<Object> get props => [counter];
}
class CounterLoading extends CounterState {
  @override
  List<Object> get props => [];
}
