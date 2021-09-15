import 'package:flutter/material.dart';
import 'package:flutter_wow_auth/utils/svg.dart';

class AppCheckbox extends StatefulWidget {
  final Function onChange;
  final bool? checked;

  AppCheckbox({
    this.checked,
    required this.onChange,
  });

  @override
  _AppCheckboxState createState() => _AppCheckboxState();
}

class _AppCheckboxState extends State<AppCheckbox> {
  bool selected = false;

  @override
  void initState() {
    selected = widget.checked ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
          widget.onChange(selected);
        });
      },
      child: AnimatedContainer(
        margin: EdgeInsets.all(4),
        duration: Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(3.0),
            border: Border.all(
              color: Colors.black,
              width: 1.5,
            )),
        width: 20.0,
        height: 20.0,
        child: selected
            ? Container(
                color: Colors.white,
                child: AppSvg(
                  'icons/checkbox.svg',
                  BoxFit.contain,
                ),
              )
            : null,
      ),
    );
  }
}
