import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GoogleIcon extends StatelessWidget {
  final double size;
  final Color? backgroundColor;

  const GoogleIcon({super.key, this.size = 24.0, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(size * 0.1),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: Padding(
        padding: EdgeInsets.all(size * 0.1),
        child: SvgPicture.asset(
          'google_icon.svg',
          width: size * 0.8,
          height: size * 0.8,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
