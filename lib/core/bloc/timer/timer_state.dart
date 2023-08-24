import 'package:equatable/equatable.dart';

abstract class TimerState extends Equatable {
  const TimerState();

  @override
  List<Object?> get props => [];
}

class TimerInitial extends TimerState {}

class TimerUpdate extends TimerState {
  final int value;

  const TimerUpdate({required this.value});

  @override
  List<Object?> get props => [value];
  @override
  String toString() =>
      'Timer { Response: $value }';
}


