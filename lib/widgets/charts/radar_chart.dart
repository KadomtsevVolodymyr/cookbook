import 'dart:math';

import 'package:balancebyte/generated/assets/assets.gen.dart';
import 'package:balancebyte/generated/assets/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;

class CustomRadarChart extends StatefulWidget {
  const CustomRadarChart({super.key});

  @override
  State<CustomRadarChart> createState() => _CustomRadarChartState();
}

class _CustomRadarChartState extends State<CustomRadarChart> {
  DateTimeRange? selectedDateRange =
      DateTimeRange(start: DateTime.now(), end: DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header with date range and calendar icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                selectedDateRange == null
                    ? 'Select Date Range'
                    : '${DateFormat('MM/dd/yyyy').format(selectedDateRange!.start!)} - ${DateFormat('MM/dd/yyyy').format(selectedDateRange!.end!)}',
                style: TextStyle(fontSize: 16),
              ),
              GestureDetector(
                onTap: () async {
                  final DateTime now = DateTime.now();
                  final DateTime? pickedDate = await showDatePicker(
                    locale: Locale.fromSubtags(
                        languageCode: 'en'), // Locale for language support
                    context: context,
                    initialDate: now, // Start date
                    firstDate: now, // Prevent past dates
                    lastDate: DateTime(now.year + 1), // Limit future dates
                    builder: (BuildContext context, Widget? child) {
                      return Theme(
                        data: Theme.of(context).copyWith(
                          useMaterial3: true, // Material 3 styling
                          colorScheme: ColorScheme.light(
                            primary: Colors.blue, // Header background color
                            onPrimary: Colors.white, // Header text color
                            onSurface: Colors.black, // Body text color
                          ),
                          dialogBackgroundColor:
                              Colors.white, // Dialog background
                          textButtonTheme: TextButtonThemeData(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.blue, // Button text color
                            ),
                          ),
                        ),
                        child: child!,
                      );
                    },
                  );

                  if (pickedDate != null) {
                    setState(() {
                      selectedDateRange = DateTimeRange(
                        start: pickedDate,
                        end: pickedDate.add(Duration(days: 6)),
                      );
                    });
                  }
                },
                child: Assets.icons.calendar.svg(),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Radar Chart
          Expanded(
            child: CustomPaint(
              painter: RadarChartPainter(
                labels: ['Fruits', 'Vegetables', 'Dairy', 'Protein', 'Grains'],
                values: [4, 3.5, 2.5, 4.2, 3.8], // Values for the radar chart
                maxValue: 5,
                levelColors: [
                  Color(0xFFF2F2F2),
                  Color(0xFFFAFAFA),
                  Color(0xFFF2F2F2),
                  Color(0xFFFAFAFA),
                  Color(0xFFF2F2F2),
                  Color(0xFFFAFAFA),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RadarChartPainter extends CustomPainter {
  RadarChartPainter({
    required this.labels,
    required this.values,
    required this.maxValue,
    required this.levelColors,
  });

  final List<String> labels;
  final List<double> values;
  final double maxValue;
  final List<Color> levelColors;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 2.5; // Adjust radius

    // Draw the radar levels (background grids)
    final step = radius / levelColors.length;
    for (int i = 0; i < levelColors.length; i++) {
      paint.color = levelColors[i];
      paint.style = PaintingStyle.fill;
      _drawPolygon(canvas, center, radius - step * i, paint, labels.length);
    }

    // Draw the axis lines
    paint.color = Colors.grey.withOpacity(0.5);
    paint.style = PaintingStyle.stroke;
    for (int i = 0; i < labels.length; i++) {
      final angle = (2 * pi / labels.length) * i - pi / 2;
      final x = center.dx + radius * cos(angle);
      final y = center.dy + radius * sin(angle);
      canvas.drawLine(center, Offset(x, y), paint);
    }

    // Draw the data polygon
    final dataPath = Path();
    paint.color = Colors.green.withOpacity(0.3);
    paint.style = PaintingStyle.fill;
    for (int i = 0; i < values.length; i++) {
      final angle = (2 * pi / values.length) * i - pi / 2;
      final x = center.dx + (radius * (values[i] / maxValue)) * cos(angle);
      final y = center.dy + (radius * (values[i] / maxValue)) * sin(angle);
      if (i == 0) {
        dataPath.moveTo(x, y);
      } else {
        dataPath.lineTo(x, y);
      }
    }
    dataPath.close();
    canvas.drawPath(dataPath, paint);

    // Draw the data polygon border
    paint.color = Colors.green;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;
    canvas.drawPath(dataPath, paint);

    // Draw the labels
    final textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: ui.TextDirection.ltr,
    );
    for (int i = 0; i < labels.length; i++) {
      final angle = (2 * pi / labels.length) * i - pi / 2;
      final x = center.dx + (radius + 20) * cos(angle); // Adjust label distance
      final y = center.dy + (radius + 20) * sin(angle);
      textPainter.text = TextSpan(
        text: labels[i],
        style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black,
            fontFamily: FontFamily.poppins),
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(x - textPainter.width / 2, y - textPainter.height / 2),
      );
    }
  }

  /// Draws a polygon for the radar levels.
  void _drawPolygon(
      Canvas canvas, Offset center, double radius, Paint paint, int sides) {
    final path = Path();
    for (int i = 0; i < sides; i++) {
      final angle = (2 * pi / sides) * i - pi / 2;
      final x = center.dx + radius * cos(angle);
      final y = center.dy + radius * sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
