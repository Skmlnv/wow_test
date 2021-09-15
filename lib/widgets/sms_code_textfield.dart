import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wow_auth/utils/colors.dart';

class AppSmsCodeTextField extends StatelessWidget {
  final Function onChange;
  const AppSmsCodeTextField({
    Key? key,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var smsMask = TextInputMask(mask: '9999');
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
            onChange(smsMask.magicMask.clearMask(value));
          },
          inputFormatters: [
            smsMask,
          ],
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '__ __ __ __',
            contentPadding: EdgeInsets.all(8.0),
          ),
        ),
      ),
    );
  }
}
