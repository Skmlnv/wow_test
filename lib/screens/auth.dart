import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_wow_auth/bloc/auth/auth_bloc.dart';
import 'package:flutter_wow_auth/bloc/auth/auth_event.dart';
import 'package:flutter_wow_auth/bloc/auth/auth_state.dart';
import 'package:flutter_wow_auth/screens/sms_code_entry.dart';
import 'package:flutter_wow_auth/utils/colors.dart';
import 'package:flutter_wow_auth/widgets/button.dart';
import 'package:flutter_wow_auth/widgets/checkbox.dart';
import 'package:flutter_wow_auth/widgets/default_app_bar.dart';
import 'package:flutter_wow_auth/widgets/phone_textfield.dart';
import 'package:url_launcher/url_launcher.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

bool agree = false;

_launchURL() async {
  const url = "https://wow.app/agreement";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw "Could not launch $url";
  }
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    final _bloc = BlocProvider.of<AuthBloc>(context);
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSMSSendOk) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => BlocProvider.value(
                  value: BlocProvider.of<AuthBloc>(context),
                  child: SmsCodeEntryScreen()),
            ),
          );
        }
        if (state is AuthSMSSendError) {
          final snackBar = SnackBar(content: Text(state.error));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return Scaffold(
            appBar: DefaultAppBar(
              disableBackButton: true,
            ),
            body: SafeArea(
              child: Container(
                padding: EdgeInsets.all(20.0),
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Введите номер телефона",
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
                          "Для использования приложения пройдите\nавторизацию по номеру телефона",
                          style: TextStyle(
                            color: appLightTextColor,
                          ),
                        ),
                        SizedBox(
                          height: 36.0,
                        ),
                        AppPhoneTextField(
                          onChange: (value) {
                            _bloc.add(
                              SavePhone(phone: value),
                            );
                          },
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        AppButton(
                          text: "Получить код",
                          disabled: !agree,
                          onTap: () {
                            _bloc.add(GetSMSCode());
                          },
                        ),
                        SizedBox(
                          height: 24.0,
                        ),
                        Row(
                          children: [
                            AppCheckbox(onChange: (value) {
                              setState(() {
                                agree = value;
                              });
                            }),
                            SizedBox(
                              width: 17.0,
                            ),
                            Flexible(
                              child: RichText(
                                text: TextSpan(
                                  text: "Я ознакомлен и принимаю",
                                  style: TextStyle(
                                    color: appMainTextColor,
                                  ),
                                  children: [
                                    TextSpan(
                                        text:
                                            " Пользовательское соглашение и Политику конфиденциальности",
                                        style: TextStyle(
                                          color: appHyperLinkColor,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () => _launchURL())
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
