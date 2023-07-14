import 'package:flutter_bloc/flutter_bloc.dart';

//Event
abstract class CounterEvent {}

class IncrementEvent extends CounterEvent {}

class DecrementEvent extends CounterEvent {}

//State
class CounterState {
  final int nomor;

  CounterState(this.nomor);
}

//Bloc
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0));

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is IncrementEvent) {
      yield CounterState(state.nomor + 1);
    } else if (event is DecrementEvent) {
      yield CounterState(state.nomor - 1);
    }
  }
}
