import 'package:auto_route/auto_route.dart';
import 'package:balancebyte/presentation/forum/community_screen/community_layout.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  static const path = 'community_screen';

  @override
  Widget build(BuildContext context) {
    return const CommunityLayout();
  }
}
