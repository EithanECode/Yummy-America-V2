import 'package:flutter/material.dart';

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
      child: CustomPaint(painter: GoogleIconPainter(), size: Size(size, size)),
    );
  }
}

class GoogleIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.35;

    // Dibujar el círculo base (blanco)
    paint.color = Colors.white;
    canvas.drawCircle(center, radius, paint);

    // Dibujar las secciones de colores
    final rect = Rect.fromCircle(center: center, radius: radius);

    // Sección roja (superior izquierda)
    paint.color = const Color(0xFFEA4335);
    canvas.drawArc(rect, -0.5, 1.2, true, paint);

    // Sección azul (derecha)
    paint.color = const Color(0xFF4285F4);
    canvas.drawArc(rect, 0.7, 1.2, true, paint);

    // Sección verde (inferior derecha)
    paint.color = const Color(0xFF34A853);
    canvas.drawArc(rect, 1.9, 1.2, true, paint);

    // Sección amarilla (inferior izquierda)
    paint.color = const Color(0xFFFBBC05);
    canvas.drawArc(rect, 3.1, 1.2, true, paint);

    // Dibujar el borde
    paint.color = Colors.grey.shade300;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 1.0;
    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
