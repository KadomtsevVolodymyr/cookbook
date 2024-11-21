import 'dart:async';
import 'dart:math';

import 'package:balancebyte/core/theme/theme_palette/default_palette.dart';
import 'package:balancebyte/core/theme/theme_palette/default_shadow_palette.dart';
import 'package:balancebyte/extensions/extensions.dart';
import 'package:balancebyte/generated/assets/assets.gen.dart';
import 'package:balancebyte/presentation/analytics/calories_screen/calories_layout.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BarChartSample1 extends StatefulWidget {
  BarChartSample1({super.key});

  List<Color> get availableColors => const <Color>[
        AppColors.contentColorPurple,
        AppColors.contentColorYellow,
        AppColors.contentColorBlue,
        AppColors.contentColorOrange,
        AppColors.contentColorPink,
        AppColors.contentColorRed,
      ];

  final Color barBackgroundColor = AppColors.contentColorWhite.withOpacity(0.3);
  final Color barColor = AppColors.contentColorWhite;
  final Color touchedBarColor = AppColors.contentColorGreen;

  @override
  State<StatefulWidget> createState() => BarChartSample1State();
}

class BarChartSample1State extends State<BarChartSample1> {
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex = -1;

  bool isPlaying = false;
  DateTimeRange? selectedDateRange;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: const [DefaultShadowPalette.primaryShadow],
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0.s),
      ),
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  top: 20.0.s, left: 20.0.s, right: 20.0.s, bottom: 24.0.s),
              child: Row(
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
                                  foregroundColor:
                                      Colors.blue, // Button text color
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
            ),
            const SizedBox(
              height: 0,
            ),
            SizedBox(
              height: 135.0.s,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: BarChart(
                  mainBarData(),
                  duration: animDuration,
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color? barColor,
    double width = 22,
    List<int> showTooltips = const [],
  }) {
    barColor ??= widget.barColor;
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          gradient: LinearGradient(
            end: Alignment(-4, -0.2),
            begin: Alignment(3, -0.08),
            colors: [
              Color(0xFF00CDAC),
              Color(0xFF75DB7E),
            ],
          ),
          toY: isTouched ? y + 1 : y,
          color: isTouched ? widget.touchedBarColor : barColor,
          width: width,
          borderSide: isTouched
              ? BorderSide(color: widget.touchedBarColor)
              : const BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 20,
            color: DefaultPalette.backgroundFormColor,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(7, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, 5, isTouched: i == touchedIndex);
          case 1:
            return makeGroupData(1, 6.5, isTouched: i == touchedIndex);
          case 2:
            return makeGroupData(2, 5, isTouched: i == touchedIndex);
          case 3:
            return makeGroupData(3, 7.5, isTouched: i == touchedIndex);
          case 4:
            return makeGroupData(4, 9, isTouched: i == touchedIndex);
          case 5:
            return makeGroupData(5, 11.5, isTouched: i == touchedIndex);
          case 6:
            return makeGroupData(6, 6.5, isTouched: i == touchedIndex);
          default:
            return throw Error();
        }
      });

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        allowTouchBarBackDraw: true,
        touchTooltipData: BarTouchTooltipData(
          fitInsideVertically: false,
          fitInsideHorizontally: true,
          tooltipMargin: 1001,
          maxContentWidth: 150,
          getTooltipColor: (_) => Colors.blueGrey,
          tooltipHorizontalAlignment: FLHorizontalAlignment.center,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            return BarTooltipItem(
              '120 kcal',
              const TextStyle(
                color: Colors.black26,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            );
          },
        ),
        touchCallback:
            (FlTouchEvent event, BarTouchResponse? barTouchResponse) {
          print(barTouchResponse?.spot!.touchedBarGroupIndex);
          setState(() {
            if (!event.isInterestedForInteractions ||
                barTouchResponse == null ||
                barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
        },
      ),
      titlesData: FlTitlesData(
        rightTitles: const AxisTitles(),
        topTitles: const AxisTitles(),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 38,
          ),
        ),
        leftTitles: const AxisTitles(),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
      gridData: const FlGridData(show: false),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: DefaultPalette.inactiveTextColor,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('SUN', style: style);
      case 1:
        text = const Text('Mon', style: style);
      case 2:
        text = const Text('Tue', style: style);
      case 3:
        text = const Text('Wed', style: style);
      case 4:
        text = const Text('Thu', style: style);
      case 5:
        text = const Text('Fri', style: style);
      case 6:
        text = const Text('Sat', style: style);
      default:
        text = const Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: text,
    );
  }

  Future<dynamic> refreshState() async {
    setState(() {});
    await Future<dynamic>.delayed(
      animDuration + const Duration(milliseconds: 50),
    );
    if (isPlaying) {
      await refreshState();
    }
  }
}

class AppColors {
  static const Color primary = contentColorCyan;
  static const Color menuBackground = Color(0xFF090912);
  static const Color itemsBackground = Color(0xFF1B2339);
  static const Color pageBackground = Color(0xFF282E45);
  static const Color mainTextColor1 = Colors.white;
  static const Color mainTextColor2 = Colors.white70;
  static const Color mainTextColor3 = Colors.white38;
  static const Color mainGridLineColor = Colors.white10;
  static const Color borderColor = Colors.white54;
  static const Color gridLinesColor = Color(0x11FFFFFF);

  static const Color contentColorBlack = Colors.black;
  static const Color contentColorWhite = Colors.black;
  static const Color contentColorBlue = Color(0xFF2196F3);
  static const Color contentColorYellow = Color(0xFFFFC300);
  static const Color contentColorOrange = Color(0xFFFF683B);
  static const Color contentColorGreen = Color(0xFF3BFF49);
  static const Color contentColorPurple = Color(0xFF6E1BFF);
  static const Color contentColorPink = Color(0xFFFF3AF2);
  static const Color contentColorRed = Color(0xFFE80054);
  static const Color contentColorCyan = Color(0xFF50E4FF);
}
