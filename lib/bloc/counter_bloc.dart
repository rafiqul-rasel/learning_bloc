import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int myCounter=0;
  CounterBloc() : super(CounterInitial(counter: 0)){
    on<BlocCounterIncrement>((event, emit) async {
      emit(CounterLoading());
      await Future.delayed(Duration(seconds: 1));
      myCounter++;
      emit(CounterUpdate(counter: myCounter));
    });
    on<BlocCounterDecrement>((event, emit) async {
      emit(CounterLoading());
      await Future.delayed(Duration(seconds: 1));
      myCounter--;
      emit(CounterUpdate(counter: myCounter));
    });

  }

}
