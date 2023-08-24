import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'index.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  TimerBloc() : super(TimerInitial()) {
    on<TimerEvent>(_mapTimerEventToState);
  }

  FutureOr<void> _mapTimerEventToState(
      TimerEvent event, Emitter<TimerState> emit) async {

    if (event is TimerAdd) {
      emit(TimerUpdate(value: event.value));
    }

  }
}
