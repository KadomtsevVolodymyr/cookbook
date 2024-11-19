import 'package:cookbook/widgets/molecules/step_item.dart';
import 'package:flutter/material.dart';

class StepList extends StatelessWidget {
  final List<String> steps;

  const StepList({
    required this.steps,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        steps.length,
        (index) => StepItem(
          stepNumber: index + 1,
          stepTitle: "Step ${index + 1}",
          description: steps[index],
          isActive: index == 0 ?? false,
          isLastStep: index == steps.length - 1,
        ),
      ),
    );
  }
}
