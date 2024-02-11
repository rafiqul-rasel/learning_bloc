part of 'counters_cubit.dart';

abstract class CountersState extends Equatable {
  CountersState();
}

class CountersInitial extends CountersState {
  final counter;
  factory CountersInitial.initials() {
    return CountersInitial(counter: 0);
  }
  @override
  List<Object> get props => [counter];
  CountersInitial copyWith({int? counter}) {
    return CountersInitial(counter: counter ?? this.counter);
  }

  CountersInitial({this.counter});
}
