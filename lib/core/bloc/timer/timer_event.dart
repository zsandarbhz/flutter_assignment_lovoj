import 'package:equatable/equatable.dart';

abstract class TimerEvent extends Equatable {
  const TimerEvent();
}

class TimerAdd extends TimerEvent {
  final int value;

  const TimerAdd({required this.value});

  @override
  List<Object?> get props => [];
}

class TimerStop extends TimerEvent {
  final String value;

  const TimerStop({required this.value});

  @override
  List<Object?> get props => [];
}