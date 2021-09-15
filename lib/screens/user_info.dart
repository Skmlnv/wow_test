import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_wow_auth/bloc/auth/auth_bloc.dart';
import 'package:flutter_wow_auth/bloc/auth/auth_state.dart';
import 'package:flutter_wow_auth/utils/colors.dart';
import 'package:flutter_wow_auth/widgets/button.dart';
import 'package:flutter_wow_auth/widgets/default_app_bar.dart';
import 'package:flutter_wow_auth/widgets/textfield.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({
    Key? key,
  }) : super(key: key);

  @override
  _UserInfoScreenState createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              appBar: DefaultAppBar(),
              body: SafeArea(
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Укажите имя и фамилию",
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
                            "Добавьте информацию о себе, чтобы вас\nузнали клиенты",
                            style: TextStyle(
                              color: appLightTextColor,
                              height: 1.4,
                            ),
                          ),
                          SizedBox(
                            height: 36.0,
                          ),
                          AppDefaultTextField(
                            onChange: (value) {},
                          ),
                          SizedBox(
                            height: 23.0,
                          ),
                          SizedBox(
                            height: 44.0,
                          ),
                        ],
                      ),
                      AppButton(
                        text: "Далее",
                        disabled: false,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ));
        });
  }
}
