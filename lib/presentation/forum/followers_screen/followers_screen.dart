import 'package:auto_route/auto_route.dart';
import 'package:balancebyte/presentation/forum/followers_screen/followers_layout.dart';
import 'package:flutter/material.dart';

@RoutePage()
class FollowersScreen extends StatelessWidget {
  const FollowersScreen({super.key});

  static const path = 'community_screen';

  @override
  Widget build(BuildContext context) {
    return const FollowersLayout();
  }
}
