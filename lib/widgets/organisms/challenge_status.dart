import 'package:balancebyte/core/theme/theme_palette/default_palette.dart';
import 'package:balancebyte/extensions/extensions.dart';
import 'package:balancebyte/generated/assets/assets.gen.dart';
import 'package:balancebyte/widgets/molecules/gradient_container.dart';
import 'package:flutter/material.dart';

class ChallengeStatusWidget extends StatelessWidget {
  final int completedCount;

  const ChallengeStatusWidget({
    required this.completedCount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final spacing16 = SizedBox(height: 16.0.s);
    return GradientContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Do 5 trainings',
            style: context.theme.textTheme.displayMedium
                ?.copyWith(color: DefaultPalette.kDarkGreen),
          ),
          spacing16,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(5, (index) {
              return index < completedCount
                  ? Assets.icons.checkActive.svg()
                  : Assets.icons.checkUnnactive.svg();
            }),
          ),
          spacing16,
          Text(
            '5 days left until the end of the challenge',
            style: context.theme.textTheme.labelSmall
                ?.copyWith(color: DefaultPalette.inactiveTextColor),
          ),
        ],
      ),
    );
  }
}
