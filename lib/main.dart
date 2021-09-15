import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_wow_auth/bloc/auth/auth_bloc.dart';
import 'package:flutter_wow_auth/repository/auth_repository.dart';
import 'package:flutter_wow_auth/screens/auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AuthRepository _authRepository = AuthRepository();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<AuthBloc>(
        create: (context) => AuthBloc(
          authRepository: _authRepository,
        ),
        child: AuthScreen(),
      ),
    );
  }
}
