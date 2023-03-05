import 'dart:math' as math;
import 'package:flutter/material.dart';

class AnimatedZigZagProgressBar extends StatefulWidget {
  final double percentage;
  final double height;
  final double width;
  final Color color;
  final Duration duration;

  AnimatedZigZagProgressBar({
    required this.percentage,
    this.height = 20.0,
    this.width = 300.0,
    this.color = Colors.blue,
    this.duration = const Duration(milliseconds: 500),
  });

  @override
  _AnimatedZigZagProgressBarState createState() => _AnimatedZigZagProgressBarState();
}

class _AnimatedZigZagProgressBarState extends State<AnimatedZigZagProgressBar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void didUpdateWidget(AnimatedZigZagProgressBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.percentage != widget.percentage) {
      _controller.reset();
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
       Positioned (
         top: 30,
         child:SizedBox(
          height: widget.height,
          width: widget.width,
          child:  Text("Level 1",
              style: TextStyle(
                  fontFamily: 'Acme',
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.black54)),
        ),),
        Positioned (
          top: 30,
          left: 135,
          child:SizedBox(
            height: widget.height,
            width: widget.width,
            child:  Text("Level 2",
                style: TextStyle(
                    fontFamily: 'Acme',
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.black54)),
          ),),
        Positioned (
          top: 30,
          left: 265,
          child:SizedBox(
            height: widget.height,
            width: widget.width,
            child:  Text("Level 3",
                style: TextStyle(
                    fontFamily: 'Acme',
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.black54)),
          ),),



        SizedBox(
          height: widget.height,
          width: widget.width,
          child: CustomPaint(
            painter: _ZigZagProgressBarPainter(
              percentage: 1.0,
              color: Colors.grey,
              animationValue: _animation.value,
            ),
          ),
        ),
        SizedBox(
          height: widget.height,
          width: widget.width,
          child: CustomPaint(
            painter: _ZigZagProgressBarPainter(
              percentage: widget.percentage,
              color: widget.color,
              animationValue: _animation.value,
            ),
          ),
        ),
      ],
    );
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _ZigZagProgressBarPainter extends CustomPainter {
  final double percentage;
  final double strokeWidth;
  final Color color;
  final double animationValue;

  _ZigZagProgressBarPainter({
    required this.percentage,
    this.strokeWidth = 10.0,
    this.color = Colors.blue,
    required this.animationValue,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    final progressWidth = size.width * percentage;

    // Starting point
    path.moveTo(0, size.height / 2);

    // Draw the zig-zag line
    for (double i = 0; i < progressWidth; i += strokeWidth * 14) {
      final x1 = math.min(i + strokeWidth, progressWidth);
      final y1 = size.height;
      final x2 = math.min(i + strokeWidth * 8, progressWidth);
      final y2 = size.height / 12 + animationValue * size.height / 12;
      path.lineTo(x1, y1);
      path.lineTo(x2, y2);
    }

    // Draw the remaining progress bar as a straight line
    path.lineTo(progressWidth, size.height / 2);

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_ZigZagProgressBarPainter oldDelegate) {
    return oldDelegate.percentage != percentage || oldDelegate.animationValue != animationValue;
  }
}
