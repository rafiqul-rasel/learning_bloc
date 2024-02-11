import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counters_state.dart';

class CountersCubit extends Cubit<CountersInitial> {
  CountersCubit() : super(CountersInitial.initials());

  increment() {
    emit(state.copyWith(counter: state.counter + 1));
  }

  decrement() {
    emit(state.copyWith(counter: state.counter - 1));
  }
}
