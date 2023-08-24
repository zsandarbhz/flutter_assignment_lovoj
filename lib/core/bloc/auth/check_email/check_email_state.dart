import 'package:equatable/equatable.dart';

abstract class CheckEmailState extends Equatable{
  const CheckEmailState();

  @override
  List<Object?> get props => [];
}

class CheckEmailInitial extends CheckEmailState{}

class CheckEmailLoading extends CheckEmailState{}

class CheckEmailSuccess extends CheckEmailState{
  final dynamic response;

  const CheckEmailSuccess({required this.response});

  @override
  List<Object> get props => [];
}

class CheckEmailFailure extends CheckEmailState {
  final String error;

  const CheckEmailFailure({required this.error});

  @override
  List<Object> get props => [error];

}

class SendAgainInitial extends CheckEmailState{}

class SendAgainLoading extends CheckEmailState{}

class SendAgainSuccess extends CheckEmailState{
  final dynamic response;

  const SendAgainSuccess({required this.response});

  @override
  List<Object> get props => [];
}

class SendAgainFailure extends CheckEmailState {
  final String error;

  const SendAgainFailure({required this.error});

  @override
  List<Object> get props => [error];

}

