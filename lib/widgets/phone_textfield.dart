import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wow_auth/utils/colors.dart';
import 'package:flutter_wow_auth/utils/svg.dart';

class AppPhoneTextField extends StatelessWidget {
  final Function onChange;
  const AppPhoneTextField({
    Key? key,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var phoneMask = TextInputMask(mask: '\\+9 (999) 999 99 99');
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
            onChange(phoneMask.magicMask.clearMask(value));
          },
          inputFormatters: [
            phoneMask,
          ],
          decoration: InputDecoration(
            prefixIcon: Container(
              width: 80.0,
              child: Row(
                children: [
                  Text(
                    'RU',
                    style: TextStyle(
                      color: appMainTextColor,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  AppSvg(
                    'icons/flag_ru.svg',
                    BoxFit.contain,
                  ),
                ],
              ),
            ),
            border: InputBorder.none,
            hintText: '+7 (___) __ __ ___',
            contentPadding: EdgeInsets.all(8.0),
          ),
        ),
      ),
    );
  }
}
