import 'package:auto_route/auto_route.dart';
import 'package:balancebyte/presentation/forum/following_screen/following_layout.dart';
import 'package:flutter/material.dart';

@RoutePage()
class FollowingScreen extends StatelessWidget {
  const FollowingScreen({super.key});

  static const path = 'community_screen';

  @override
  Widget build(BuildContext context) {
    return const FollowingLayout();
  }
}
