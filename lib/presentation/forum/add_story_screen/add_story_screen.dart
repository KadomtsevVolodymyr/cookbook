import 'package:auto_route/auto_route.dart';
import 'package:balancebyte/presentation/forum/add_story_screen/add_story_layout.dart';
import 'package:balancebyte/presentation/forum/add_story_screen/cubit/add_story_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class AddStoryScreen extends StatelessWidget {
  const AddStoryScreen({super.key});

  static const path = 'add_story_screen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddStoryCubit>(
      create: (context) => AddStoryCubit()..loadGallery(),
      child: const AddStoryLayout(),
    );
  }
}
