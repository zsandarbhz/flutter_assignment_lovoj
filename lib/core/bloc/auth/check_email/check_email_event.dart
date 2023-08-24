import 'package:equatable/equatable.dart';

abstract class CheckEmailEvent extends Equatable {
  const CheckEmailEvent();
}

class CheckEmailBtnPress extends CheckEmailEvent{
  final dynamic request;

  const CheckEmailBtnPress({required this.request});

  @override
  List<Object?> get props => [];
}

class SendAgainPress extends CheckEmailEvent{
  final dynamic request;

  const SendAgainPress({required this.request});

  @override
  List<Object?> get props => [];
}