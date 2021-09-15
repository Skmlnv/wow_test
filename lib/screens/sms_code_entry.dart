import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_wow_auth/bloc/auth/auth_bloc.dart';
import 'package:flutter_wow_auth/bloc/auth/auth_event.dart';
import 'package:flutter_wow_auth/bloc/auth/auth_state.dart';
import 'package:flutter_wow_auth/screens/user_info.dart';
import 'package:flutter_wow_auth/utils/colors.dart';
import 'package:flutter_wow_auth/utils/timer.dart';
import 'package:flutter_wow_auth/widgets/button.dart';
import 'package:flutter_wow_auth/widgets/default_app_bar.dart';
import 'package:flutter_wow_auth/widgets/sms_code_textfield.dart';

class SmsCodeEntryScreen extends StatefulWidget {
  const SmsCodeEntryScreen({
    Key? key,
  }) : super(key: key);

  @override
  _SmsCodeEntryScreenState createState() => _SmsCodeEntryScreenState();
}

bool smsResend = false;

class _SmsCodeEntryScreenState extends State<SmsCodeEntryScreen> {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AuthBloc>(context);
    MagicMask phoneMask = MagicMask.buildMask('\\+9 (999) 999 99 99');

    return BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
      if (state is AuthSendCodeOk) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                value: BlocProvider.of<AuthBloc>(context),
                child: UserInfoScreen()),
          ),
        );
      }
      if (state is AuthSendCodeError) {
        final snackBar = SnackBar(content: Text(state.error));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }, builder: (context, state) {
      return Scaffold(
          appBar: DefaultAppBar(),
          body: SafeArea(
            child: Container(
              padding: EdgeInsets.all(20.0),
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Введите код из СМС",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          color: appMainTextColor,
                        ),
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
                      Text(
                        "На номер ${phoneMask.getMaskedString(
                          bloc.state.phone,
                        )} отправлено СМС\nс проверочным кодом, введите его",
                        style: TextStyle(
                          color: appLightTextColor,
                          height: 1.4,
                        ),
                      ),
                      SizedBox(
                        height: 36.0,
                      ),
                      AppSmsCodeTextField(
                        onChange: (value) {
                          if (value.length == 4) {
                            Future.delayed(const Duration(milliseconds: 500),
                                () {
                              bloc.add(SendSMSCode(code: value));
                            });
                          }
                        },
                      ),
                      SizedBox(
                        height: 23.0,
                      ),
                      SMSTimer(
                        callBack: (value) {
                          setState(() {
                            smsResend = value;
                          });
                        },
                      ),
                      SizedBox(
                        height: 44.0,
                      ),
                      AppButton(
                        text: "Отправить повторно",
                        disabled: !smsResend,
                        onTap: () {
                          bloc.add(SMSCodeResend(phone: state.phone));
                          setState(() {
                            smsResend = false;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ));
    });
  }
}
