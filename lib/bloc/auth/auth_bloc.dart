import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_wow_auth/bloc/auth/auth_event.dart';
import 'package:flutter_wow_auth/bloc/auth/auth_state.dart';
import 'package:flutter_wow_auth/models/send_code_model.dart';
import 'package:flutter_wow_auth/repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({
    required this.authRepository,
  }) : super(AuthState());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is SavePhone) {
      yield state.copyWith(
        phone: event.phone,
      );
    }
    if (event is GetSMSCode) {
      String status = await authRepository.sendSMS(
        state.phone,
      );
      String phone = state.phone;
      if (status == "OK") {
        yield AuthSMSSendOk();
        yield state.copyWith(
          phone: phone,
        );
      } else {
        yield AuthSMSSendError(
          phone: phone,
          error: status,
        );
      }
    }
    if (event is SendSMSCode) {
      SendCodeModel? sendCode = await authRepository.sendCode(
        state.phone,
        event.code,
      );
      String phone = state.phone;
      if (sendCode.status == "OK") {
        yield AuthSendCodeOk();
        yield state.copyWith(
            phone: phone,
            tokenType: sendCode.tokenType,
            accessToken: sendCode.accessToken,
            refreshToken: sendCode.refreshToken);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("tokenType", sendCode.tokenType!);
        prefs.setString("accessToken", sendCode.accessToken!);
        prefs.setString("refreshToken", sendCode.refreshToken!);
      } else {
        yield AuthSendCodeError(
          phone: phone,
          error: sendCode.error!.message.toString(),
        );
      }
    }
    if (event is SMSCodeResend) {
      String status = await authRepository.sendSMS(
        state.phone,
      );
      String phone = state.phone;
      if (status == "OK") {
        yield AuthSMSSendOk();
        yield state.copyWith(
          phone: phone,
        );
      } else {
        yield AuthSMSSendError(
          phone: phone,
          error: status,
        );
      }
    }
  }
}
