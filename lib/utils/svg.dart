import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppSvg extends StatelessWidget {
  final double? width;
  final double? height;
  final String path;
  final Color? color;
  final BoxFit fit;

  AppSvg(
    this.path,
    this.fit, {
    this.width,
    this.height,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset('assets/images/$path',
        width: width, height: height, color: color, fit: fit);
  }
}
