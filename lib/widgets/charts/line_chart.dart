import 'package:balancebyte/core/theme/theme_palette/default_palette.dart';
import 'package:balancebyte/generated/assets/assets.gen.dart';
import 'package:balancebyte/generated/assets/fonts.gen.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LineChartFlow extends StatelessWidget {
  const LineChartFlow({required this.isShowingMainData});

  final bool isShowingMainData;

  @override
  Widget build(BuildContext context) {
    return LineChart(
      sampleData1,
      duration: const Duration(milliseconds: 250),
    );
  }

  LineChartData get sampleData1 => LineChartData(
        lineTouchData: lineTouchData,
        gridData: gridData,
        titlesData: titlesData,
        borderData: borderData,
        lineBarsData: lineBarsData,
        minX: 9,
        maxX: 15,
        maxY: 100,
        minY: 0,
      );

  LineTouchData get lineTouchData => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          getTooltipColor: (lineSpot) {
            return Colors.white;
          },
          tooltipRoundedRadius: 8,
          // fitInsideHorizontally: true,
          fitInsideVertically: true,
          getTooltipItems: (touchedSpots) {
            return touchedSpots.map((touchedSpot) {
              final value = touchedSpot.y.toInt();
              return LineTooltipItem(
                '$value ↓',
                const TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                children: [],
              );
            }).toList();
          },
        ),
      );

  FlGridData get gridData => FlGridData(
        show: true,
        drawHorizontalLine: true,
        drawVerticalLine: false, // Only show horizontal lines
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Colors.grey.withOpacity(0.2),
            strokeWidth: 1.0,
          );
        },
      );

  FlTitlesData get titlesData => FlTitlesData(
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 40,
            interval: 20,
            getTitlesWidget: (value, meta) {
              final isHighlighted = value == 60;
              return Text(
                value.toInt().toString(),
                style: TextStyle(
                    fontSize: 16,
                    fontWeight:
                        isHighlighted ? FontWeight.bold : FontWeight.w400,
                    color: isHighlighted
                        ? DefaultPalette.activeNavColor
                        : DefaultPalette.inactiveTextColor,
                    fontFamily: FontFamily.poppins),
                textAlign: TextAlign.center,
              );
            },
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 32,
            interval: 1,
            getTitlesWidget: (value, meta) {
              String text = '';
              final isHighlighted = value == 11;
              switch (value.toInt()) {
                case 9:
                  text = '09';
                  break;
                case 10:
                  text = '10';
                  break;
                case 11:
                  text = '11';
                  break;
                case 12:
                  text = '12';
                  break;
                case 13:
                  text = '13';
                  break;
                case 14:
                  text = '14';
                  break;
                case 15:
                  text = '15';
                  break;
                default:
                  text = '';
              }
              return Text(
                text,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight:
                        isHighlighted ? FontWeight.bold : FontWeight.w400,
                    color: isHighlighted
                        ? DefaultPalette.activeNavColor
                        : DefaultPalette.inactiveTextColor,
                    fontFamily: FontFamily.poppins),
              );
            },
          ),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(color: Colors.transparent),
          left: BorderSide(color: Colors.transparent),
          right: BorderSide(color: Colors.transparent),
          top: BorderSide(color: Colors.transparent),
        ),
      );

  List<LineChartBarData> get lineBarsData => [
        LineChartBarData(
          isCurved: true,
          color: Colors.green,
          barWidth: 2,
          isStrokeCapRound: true,
          belowBarData: BarAreaData(
            show: false,
          ),
          dotData: FlDotData(
            show: true,
            checkToShowDot: (spot, barData) => true,
            getDotPainter: (spot, percent, bar, index) {
              return FlDotCirclePainter(
                radius: 4,
                color: Colors.green,
                strokeWidth: 2,
                strokeColor: Colors.white,
              );
            },
          ),
          spots: const [
            FlSpot(9, 60),
            FlSpot(10, 40),
            FlSpot(11, 80),
            FlSpot(12, 70),
            FlSpot(13, 50),
            FlSpot(14, 90),
            FlSpot(15, 85),
          ],
        ),
      ];
}

class LineChartSample1 extends StatefulWidget {
  const LineChartSample1({super.key});

  @override
  State<StatefulWidget> createState() => LineChartSample1State();
}

class LineChartSample1State extends State<LineChartSample1> {
  late bool isShowingMainData;

  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
  }

  DateTimeRange? selectedDateRange;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 338,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 26),
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: LineChartFlow(isShowingMainData: isShowingMainData),
            ),
          ),
        ],
      ),
    );
  }
}
