import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  const ClockView({Key? key}) : super(key: key);

  @override
  State<ClockView> createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      child: Transform.rotate(
        angle: -pi / 2,
        child: CustomPaint(
          painter: ClockPainter(),
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  var dateTime = DateTime.now();

  // 60 sec - 360 , 1 sec - 6 degree
  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);
    var fillBrush = Paint()..color = Color(0xFF444974);
    // for the outline we have
    var outlineBrush = Paint()
      ..color = Color(0xFFEAECFF)
      ..strokeWidth = 16
      ..style = PaintingStyle.stroke;
    // centerfill brush here... color
    var centerFillBrush = Paint()..color = Color(0xFFEAECFF);
    // seconds hand brush here...
    var secHandBrush = Paint()
      ..color = Colors.orangeAccent
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    // min hand brush here...
    var minHandBrush = Paint()
      ..shader = RadialGradient(colors: [Color(0xFF748EF6), Color(0xFF77BDDFF)])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..strokeWidth = 16
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    // hour hand brush here...
    var hourHandBrush = Paint()
      ..shader = RadialGradient(colors: [Color(0xFFEA74AB), Color(0xFFC279)])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..strokeWidth = 16
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    var dashBrush = Paint()
      ..color = Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1;
    // draw the circle
    canvas.drawCircle(center, radius - 40, fillBrush);
    // draw the outline here...
    canvas.drawCircle(center, radius - 40, outlineBrush);
    // CIRCUMFERENCE
    var minHandX = centerX + 80 * cos(dateTime.minute * 6 * pi / 180);
    var minHandY = centerX + 80 * sin(dateTime.minute * 6 * pi / 180);
    // for mins
    canvas.drawLine(center, Offset(minHandX, minHandY), minHandBrush);
    // for hours
    // CIRCUMFERENCE
    var hourHandX = centerX +
        80 * cos((dateTime.hour * 30 + dateTime.hour * 0.5) * pi / 180);
    var hourHandY = centerX +
        80 * sin((dateTime.hour * 30 + dateTime.hour * 0.5) * pi / 180);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandBrush);

    // CIRCUMFERENCE
    var secHandX = centerX + 80 * cos(dateTime.second * 6 * pi / 180);
    var secHandY = centerX + 80 * sin(dateTime.second * 6 * pi / 180);
    // draw line for times sec hour and min
    //seconds
    canvas.drawLine(center, Offset(secHandX, secHandY), secHandBrush);
    // draw the center point clock
    canvas.drawCircle(center, 16, centerFillBrush);
    var outerCircleRadius = radius;
    var innerCircleRadius = radius - 14;
    for (double i = 0; i < 360; i += 12) {
      var x1 = centerX + outerCircleRadius * cos(i * pi / 180);
      var y1 = centerX + outerCircleRadius * sin(i * pi / 180);
      var x2 = centerX + innerCircleRadius * cos(i * pi / 180);
      var y2 = centerX + innerCircleRadius * sin(i * pi / 180);
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
