
import 'package:equatable/equatable.dart';

abstract class LogoutEvent extends Equatable{
  const LogoutEvent();
}

class LogoutBtnPressed extends LogoutEvent {
  var request;

  LogoutBtnPressed({
    required this.request,
  });

  @override
  List<Object?> get props => [request];
}

