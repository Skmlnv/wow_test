import 'package:flutter/material.dart';
import 'package:flutter_wow_auth/utils/colors.dart';

class AppButton extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final bool disabled;
  final Function onTap;
  const AppButton({
    Key? key,
    this.width = double.infinity,
    this.height = 44.0,
    required this.text,
    this.disabled = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0, 1.0],
          colors: [
            disabled ? Colors.transparent : Color(0xffFF7A00),
            disabled ? Colors.transparent : Color(0xffFFA800),
          ],
        ),
        borderRadius: BorderRadius.circular(40.0),
      ),
      child: IgnorePointer(
        ignoring: disabled,
        child: ElevatedButton(
          onPressed: () {
            onTap();
          },
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: disabled ? appDisabledButtonColor : Colors.transparent,
            elevation: 0.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0),
            ),
          ),
        ),
      ),
    );
  }
}
