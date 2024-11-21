import 'package:balancebyte/extensions/extensions.dart';
import 'package:flutter/material.dart';

class AddStoryButton extends StatelessWidget {
  final Color iconColor;

  const AddStoryButton({
    this.iconColor = Colors.green,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.0.s,
      height: 70.0.s,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0.s),
      ),
      child: Center(
        child: Icon(
          Icons.add,
          color: iconColor,
        ),
      ),
    );
  }
}
