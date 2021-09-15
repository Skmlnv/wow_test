import 'package:flutter/material.dart';
import 'package:flutter_wow_auth/utils/colors.dart';

class AppDefaultTextField extends StatelessWidget {
  final Function onChange;
  const AppDefaultTextField({
    Key? key,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.0,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: appTextFieldShadow.withOpacity(0.15),
              offset: Offset(0.0, 4.0),
              blurRadius: 16.0,
              spreadRadius: 0.0,
            ),
          ]),
      child: Center(
        child: TextField(
          onChanged: (value) {
            onChange(value);
          },
          style: TextStyle(
            color: appLightTextColor,
          ),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(8.0),
              hintText: "Анна Борзова"),
        ),
      ),
    );
  }
}
