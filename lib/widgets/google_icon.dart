import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GoogleIcon extends StatelessWidget {
  final double size;

  const GoogleIcon({super.key, this.size = 24.0});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/google_icon.svg',
      width: size,
      height: size,
      fit: BoxFit.contain,
    );
  }
}
