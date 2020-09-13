import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(0, null));

  void increment() {
    emit(CounterState(state.counterValue = state.counterValue + 1, true));
  }

  void decrement() {
    emit(CounterState(state.counterValue = state.counterValue - 1, false));
  }
}
