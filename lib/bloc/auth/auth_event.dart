import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthEvent {}

class SavePhone extends AuthEvent {
  final String phone;
  SavePhone({required this.phone});
}

class SendSMSCode extends AuthEvent {
  final String code;
  SendSMSCode({required this.code});
}

class GetSMSCode extends AuthEvent {}

class SMSCodeResend extends AuthEvent {
  final String phone;
  SMSCodeResend({required this.phone});
}
