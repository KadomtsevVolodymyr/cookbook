import 'package:balancebyte/core/theme/theme_palette/default_palette.dart';
import 'package:balancebyte/extensions/extensions.dart';
import 'package:balancebyte/generated/assets/assets.gen.dart';
import 'package:balancebyte/widgets/atoms/spacing.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DonutChartCard extends StatefulWidget {
  const DonutChartCard({super.key});

  @override
  State<DonutChartCard> createState() => _DonutChartCardState();

  /// Configures the pie chart sections with varied widths for a 3D effect.
  static List<PieChartSectionData> pieChartSections() {
    return [
      // Outermost section
      PieChartSectionData(
        value: 76.8,
        color: const Color(0xFF77DD77),
        radius: 50, // Widest section
        title: '',
      ),
      // Middle section
      PieChartSectionData(
        value: 34.8,
        color: const Color(0xFFB9FBC0),
        radius: 45, // Slightly narrower
        title: '',
      ),
      // Innermost section
      PieChartSectionData(
        value: 23.8,
        color: const Color(0xFF1FAB89),
        radius: 40, // Narrowest section
        title: '',
      ),
    ];
  }
}

class _DonutChartCardState extends State<DonutChartCard> {
  DateTimeRange? selectedDateRange;
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
                onTap: () {},
                child: Assets.icons.calendar.svg(),
              ),
            ],
          ),
          const SizedBox(height: 40),
          // Donut Chart
          SizedBox(
            height: 180,
            child: PieChart(
              PieChartData(
                startDegreeOffset: 270,
                sections: DonutChartCard.pieChartSections(),
                centerSpaceRadius: 50,
                centerSpaceColor: Colors.white,
                sectionsSpace: 0, // No space between segments for a clean look
              ),
            ),
          ),
          const SizedBox(height: 24),
          // Legend
          Column(
            children: [
              buildLegendItem(
                  '76,8%', 'Fet', const Color(0xFF77DD77), 'Normal', context),
              Spacing.spacing8,
              Divider(
                color: DefaultPalette.inactiveTextColor?.withOpacity(0.4),
              ),
              Spacing.spacing12,
              buildLegendItem(
                  '34,8%', 'Carbs', const Color(0xFFB9FBC0), 'Normal', context),
              Spacing.spacing8,
              Divider(
                color: DefaultPalette.inactiveTextColor?.withOpacity(0.4),
              ),
              Spacing.spacing12,
              buildLegendItem('23,8%', 'Protein', const Color(0xFF1FAB89),
                  'Normal', context),
            ],
          ),
        ],
      ),
    );
  }

  /// Creates a legend item row.
  Widget buildLegendItem(String percentage, String label, Color color,
      String status, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 16,
              width: 16,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              '$percentage $label',
              style: context.theme.textTheme.titleLarge
                  ?.copyWith(color: DefaultPalette.inactiveTextColor),
            ),
          ],
        ),
        Text(
          status,
          style: context.theme.textTheme.titleLarge
              ?.copyWith(color: DefaultPalette.inactiveTextColor),
        ),
      ],
    );
  }
}
