import 'package:flutter/material.dart';

class GradientSwitch extends StatefulWidget {
  const GradientSwitch({super.key});

  @override
  State<GradientSwitch> createState() => _GradientSwitchState();
}

class _GradientSwitchState extends State<GradientSwitch> {
  bool isSwitchOn = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isSwitchOn = !isSwitchOn;
            });
          },
          child: Stack(
            alignment:
                isSwitchOn ? Alignment.centerRight : Alignment.centerLeft,
            children: [
              Container(
                width: 48,
                height: 24,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: isSwitchOn
                        ? [
                            const Color(0xFF18593F),
                            const Color(0xFF75DB7E),
                          ]
                        : [Colors.grey[400]!, Colors.grey[500]!],
                  ),
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                left: isSwitchOn ? 28 : 4,
                child: Container(
                  height: 16,
                  width: 16,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
