import 'package:cookbook/core/theme/theme_palette/default_palette.dart';
import 'package:cookbook/extensions/extensions.dart';
import 'package:cookbook/widgets/atoms/dashed_line_painter.dart';
import 'package:cookbook/widgets/atoms/spacing.dart';
import 'package:flutter/material.dart';

class StepItem extends StatelessWidget {
  final int stepNumber;
  final String stepTitle;
  final String description;
  final bool isActive;
  final bool isLastStep;

  const StepItem({
    required this.stepNumber,
    required this.stepTitle,
    required this.description,
    this.isActive = false,
    this.isLastStep = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 20.0.s,
                  child: Text(
                    stepNumber.toString().padLeft(2, '0'),
                    style: context.theme.textTheme.displayMedium?.copyWith(
                      color: isActive
                          ? DefaultPalette.activeNavColor
                          : DefaultPalette.inactiveTextColor,
                    ),
                  ),
                ),
                Spacing.spacingW8,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 20.0.s,
                      height: 20.0.s,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: DefaultPalette.inactiveTextColor,
                        gradient: isActive
                            ? const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xFF18593F),
                                  Color(0xFF75DB7E),
                                ],
                              )
                            : null,
                      ),
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.all(2.0.s),
                        child: Container(
                          width: 16.0.s,
                          height: 16.0.s,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: isActive
                                  ? DefaultPalette.white
                                  : DefaultPalette.white,
                              width: 4.0.s,
                            ),
                            gradient: isActive
                                ? const LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Color(0xFF18593F),
                                      Color(0xFF75DB7E),
                                    ],
                                  )
                                : null,
                            color: DefaultPalette.inactiveTextColor,
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ),
                    ),
                    if (!isLastStep)
                      CustomPaint(
                        size: Size(
                          2.0.s,
                          60.0.s,
                        ),
                        painter: DashedLinePainter(
                          color: isActive
                              ? DefaultPalette.activeNavColor
                              : DefaultPalette.inactiveTextColor,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ],
        ),
        Spacing.spacingW12,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                stepTitle,
                style: context.theme.textTheme.displayMedium?.copyWith(
                  color: DefaultPalette.kDarkGreen,
                ),
              ),
              Spacing.spacing4,
              Text(
                description,
                style: context.theme.textTheme.displayMedium?.copyWith(
                  color: DefaultPalette.inactiveTextColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
