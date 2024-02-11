part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();
}
 class BlocCounterIncrement extends CounterEvent{
  @override
  List<Object?> get props => [];
}

class BlocCounterDecrement extends CounterEvent{
  @override
  List<Object?> get props => [];
}