import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  final String phone;
  final String tokenType;
  final String accessToken;
  final String refreshToken;
  final String error;

  const AuthState({
    this.phone = '',
    this.tokenType = '',
    this.accessToken = '',
    this.refreshToken = '',
    this.error = '',
  });

  AuthState copyWith({
    String? phone,
    String? tokenType,
    String? accessToken,
    String? refreshToken,
    String? error,
  }) {
    return AuthState(
      phone: phone ?? this.phone,
      tokenType: tokenType ?? this.tokenType,
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [
        phone,
        tokenType,
        accessToken,
        refreshToken,
        error,
      ];
}

class AuthSMSSendOk extends AuthState {}

class AuthSMSSendError extends AuthState {
  final String phone;
  final String error;
  AuthSMSSendError({
    required this.phone,
    required this.error,
  });
}

class AuthSendCodeOk extends AuthState {}

class AuthSendCodeError extends AuthState {
  final String phone;
  final String error;
  AuthSendCodeError({
    required this.phone,
    required this.error,
  });
}

class AuthInitial extends AuthState {}
