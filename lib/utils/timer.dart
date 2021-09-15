import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_wow_auth/utils/colors.dart';

class SMSTimer extends StatefulWidget {
  final Function(bool value) callBack;
  SMSTimer({
    required this.callBack,
  });
  @override
  _SMSTimerState createState() => _SMSTimerState();
}

class _SMSTimerState extends State<SMSTimer> {
  final interval = const Duration(seconds: 1);
  final int timerValue = 60;
  int timerCurrentValue = 0;

  String get timerText =>
      '${((timerValue - timerCurrentValue) ~/ 60).toString().padLeft(2, '0')}:${((timerValue - timerCurrentValue) % 60).toString().padLeft(2, '0')}';

  startTimeout([int? milliseconds]) {
    var duration = interval;
    Timer.periodic(duration, (timer) {
      setState(() {
        timerCurrentValue = timer.tick;

        if (timer.tick >= timerValue) {
          timer.cancel();
          widget.callBack(true);
        }
      });
    });
  }

  @override
  void initState() {
    startTimeout();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "Не пришел код? Вы можете запросить его\nповторно через $timerText сек.",
      style: TextStyle(
        color: appLightTextColor,
        fontSize: 12.0,
        height: 1.4,
      ),
    );
  }
}
