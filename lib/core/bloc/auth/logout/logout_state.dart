
import 'package:equatable/equatable.dart';

import '../../../models/auth/user_model.dart';

abstract class LogoutState extends Equatable {
  const LogoutState();

  @override
  List<Object?> get props => [];
}

class LogoutInit extends LogoutState {}

class LogoutLoading extends LogoutState {}

class LogoutSuccess extends LogoutState {
  final String response;
  const LogoutSuccess(
      {required this.response});
  @override
  List<Object?> get props => [response];
}

class LogoutFailure extends LogoutState {
  final String? error;
  const LogoutFailure({required this.error});

  @override
  String toString() => '{error: $error}';
}