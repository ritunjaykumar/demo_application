import 'package:flutter/material.dart';
import 'dart:math';


class ArcProgressIndicator extends StatefulWidget {
  final double strokeWidth;
  final double width;
  final double height;
  final Color color;

  const ArcProgressIndicator({
    super.key,
    this.strokeWidth = 5.0,
    required this.width,
    required this.height,
    this.color = Colors.blue,
  });

  @override
  _ArcProgressIndicatorState createState() => _ArcProgressIndicatorState();
}

class _ArcProgressIndicatorState extends State<ArcProgressIndicator> {
  double progress = 0.5; // Initialize progress to 50%

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center, // Center the text
      children: [
        GestureDetector(
          onPanUpdate: (details) {
            _handleDrag(details.localPosition, widget.width, widget.height);
          },
          child: SizedBox(
            width: widget.width,
            height: widget.height,
            child: CustomPaint(
              painter: _ArcPainter(progress, widget.strokeWidth, widget.color),
            ),
          ),
        ),
        // Display the progress percentage in the center of the arc
        Positioned(
          child: Text(
            '${(progress * 100).toInt()}%', // Display progress as percentage
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: widget.color,
            ),
          ),
        ),
      ],
    );
  }

  // Handle drag to update progress based on the touch position
  void _handleDrag(Offset localPosition, double width, double height) {
    double centerX = width / 2;
    double centerY = height;

    // Get the relative position from the center of the arc
    double dx = localPosition.dx - centerX;
    double dy = localPosition.dy - centerY;

    // Calculate the angle from the touch point relative to the center
    double angle = atan2(dy, dx);

    // Restrict the angle between 180 degrees (-pi) to 0 degrees (pi)
    if (angle < -pi) angle += 2 * pi;

    // Ensure that we are only working in the 180-degree range (from left to right of arc)
    if (angle >= -pi && angle <= 0) {
      double normalizedAngle = (angle + pi) / pi; // Normalize to range [0, 1]
      setState(() {
        progress = normalizedAngle; // Update progress
      });
    }
  }
}

class _ArcPainter extends CustomPainter {
  final double progress;
  final double strokeWidth;
  final Color color;

  _ArcPainter(this.progress, this.strokeWidth, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    // Calculate the center of the arc at the bottom-middle of the available space
    double centerX = size.width / 2;
    double centerY = size.height;

    // Calculate the radius (arc should fit within the available width and height)
    double radius = (min(size.width, size.height * 2)) / 2 - strokeWidth;

    // Define the paint for the arc
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    // Draw the 180-degree arc
    Rect rect = Rect.fromCircle(center: Offset(centerX, centerY), radius: radius);

    double startAngle = pi; // Start from the left (9 o'clock position)
    double sweepAngle = pi; // Sweep for 180 degrees

    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);

    // Calculate the position of the indicator based on the progress (0.0 to 1.0)
    double indicatorAngle = startAngle + sweepAngle * progress;

    double indicatorX = centerX + radius * cos(indicatorAngle);
    double indicatorY = centerY + radius * sin(indicatorAngle);

    // Paint for the indicator circle
    Paint indicatorPaint = Paint()..color = color;

    // Draw the small circle (indicator) at the position calculated
    canvas.drawCircle(Offset(indicatorX, indicatorY), strokeWidth * 1.5, indicatorPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Redraw when progress changes
  }
}

//////////////////////////////
//import 'package:flutter/material.dart';
// import 'dart:math';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(title: Text('Arc Progress Indicator')),
//         body: Center(
//           child: ArcProgressIndicator(
//             progress: 0.75, // Set progress from 0.0 to 1.0
//             strokeWidth: 10.0,
//             width: 600.0,  // User-defined width
//             height: 200.0, // User-defined height
//             color: Colors.blue,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class ArcProgressIndicator extends StatelessWidget {
//   final double progress; // Progress from 0.0 to 1.0
//   final double strokeWidth;
//   final double width;
//   final double height;
//   final Color color;
//
//   ArcProgressIndicator({
//     required this.progress,
//     this.strokeWidth = 5.0,
//     required this.width,
//     required this.height,
//     this.color = Colors.blue,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: width,
//       height: height,
//       child: CustomPaint(
//         painter: _ArcPainter(progress, strokeWidth, color),
//       ),
//     );
//   }
// }
//
// class _ArcPainter extends CustomPainter {
//   final double progress;
//   final double strokeWidth;
//   final Color color;
//
//   _ArcPainter(this.progress, this.strokeWidth, this.color);
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     // Calculate the center of the arc at the bottom-middle of the available space
//     double centerX = size.width / 2;
//     double centerY = size.height;
//
//     // Calculate the radius (arc should fit within the available width and height)
//     double radius = (min(size.width, size.height * 2)) / 2 - strokeWidth;
//
//     // Define the paint for the arc
//     Paint paint = Paint()
//       ..color = color
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = strokeWidth
//       ..strokeCap = StrokeCap.round;
//
//     // Draw the 180-degree arc
//     Rect rect = Rect.fromCircle(center: Offset(centerX, centerY), radius: radius);
//     double startAngle = pi; // Start from the left (9 o'clock position)
//     double sweepAngle = pi; // Sweep for 180 degrees
//
//     canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
//
//     // Calculate the position of the indicator based on the progress (0.0 to 1.0)
//     double indicatorAngle = startAngle + sweepAngle * progress;
//     double indicatorX = centerX + radius * cos(indicatorAngle);
//     double indicatorY = centerY + radius * sin(indicatorAngle);
//
//     // Paint for the indicator circle
//     Paint indicatorPaint = Paint()..color = color;
//
//     // Draw the small circle (indicator) at the position calculated
//     canvas.drawCircle(Offset(indicatorX, indicatorY), strokeWidth * 1.5, indicatorPaint);
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true; // Redraw when progress changes
//   }
// }
