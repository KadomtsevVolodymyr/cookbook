import 'package:auto_route/auto_route.dart';
import 'package:balancebyte/presentation/forum/camera_screen/camera_layout.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CameraScreen extends StatelessWidget {
  const CameraScreen({super.key});

  static const path = 'camera_screen';

  @override
  Widget build(BuildContext context) {
    return const CameraLayout();
  }
}
