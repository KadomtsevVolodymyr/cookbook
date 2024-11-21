import 'package:balancebyte/core/theme/theme_palette/default_palette.dart';
import 'package:balancebyte/extensions/extensions.dart';
import 'package:balancebyte/generated/assets/assets.gen.dart';
import 'package:balancebyte/presentation/forum/add_story_screen/cubit/add_story_cubit.dart';
import 'package:balancebyte/presentation/forum/camera_screen/camera_screen.dart';
import 'package:balancebyte/utils/permission_utils.dart';
import 'package:balancebyte/widgets/atoms/spacing.dart';
import 'package:balancebyte/widgets/molecules/custom_button.dart';
import 'package:balancebyte/widgets/organisms/custom_appbar.dart';
import 'package:balancebyte/widgets/organisms/screen_side_offset.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:shimmer/shimmer.dart';

class AddStoryLayout extends StatelessWidget {
  const AddStoryLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Add Story',
        iconBack: true,
        onIconTap: () {},
        icon: Container(),
      ),
      body: SingleChildScrollView(
        child: ScreenSideOffset.large(
          child: BlocBuilder<AddStoryCubit, AddStoryState>(
            builder: (context, state) {
              return Column(
                children: [
                  Spacing.spacing40,
                  GestureDetector(
                    onTap: () async {
                      final hasPermission =
                          await PermissionUtils.requestCameraPermission();

                      if (hasPermission) {
                        // Navigate to camera screen if permission is granted
                        PersistentNavBarNavigator.pushNewScreen(
                          context,
                          withNavBar: false,
                          screen: const CameraScreen(),
                        );
                      } else {
                        // Show a snackbar or error if permission is denied
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                "Camera permission is required to proceed."),
                          ),
                        );
                      }
                    },
                    child: Container(
                      height: 60.0.s,
                      decoration: BoxDecoration(
                        color: const Color(0xFFECEBEB),
                        borderRadius: BorderRadius.circular(10.0.s),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Assets.icons.scannerNavActive.svg(
                            color: DefaultPalette.kDarkGreen,
                            width: 20.0.s,
                            height: 20.0.s,
                          ),
                          Spacing.spacingW10,
                          Text(
                            "Camera",
                            style: context.theme.textTheme.headlineMedium
                                ?.copyWith(color: DefaultPalette.kDarkGreen),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacing.spacing24,
                  Row(
                    children: [
                      Text(
                        "Latest",
                        style: context.theme.textTheme.headlineMedium
                            ?.copyWith(color: DefaultPalette.kDarkGreen),
                      ),
                      Spacing.spacingW8,
                      Assets.icons.arrowBottom.svg(),
                    ],
                  ),
                  Spacing.spacing12,
                  state.when(
                    initial: () => const SizedBox(),
                    loading: _buildLoadingSkeleton,
                    loaded: _buildPhotoGrid,
                    permissionDenied: () => _buildPermissionDeniedUI(context),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingSkeleton() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 105.0.s / 140.0.s,
      ),
      itemCount: 15,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(5.0.s),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPhotoGrid(List<AssetEntity> photos) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 105.0.s / 140.0.s,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        final photo = photos[index];
        return FutureBuilder<Uint8List?>(
          future: photo.thumbnailData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(5.0.s),
                child: Image.memory(
                  snapshot.data!,
                  fit: BoxFit.cover,
                ),
              );
            } else {
              return Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(5.0.s),
                  ),
                ),
              );
            }
          },
        );
      },
    );
  }

  Widget _buildPermissionDeniedUI(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacing.spacing40,
          Text(
            "Access to gallery denied",
            style: context.theme.textTheme.headlineMedium
                ?.copyWith(color: DefaultPalette.kDarkGreen),
          ),
          Spacing.spacing24,
          CustomButton.shadowed(
            text: Text(
              "Open Settings",
              style: context.theme.textTheme.headlineMedium
                  ?.copyWith(color: DefaultPalette.white),
            ),
            onPressed: () => context.read<AddStoryCubit>().openSettings(),
          ),
        ],
      ),
    );
  }
}
