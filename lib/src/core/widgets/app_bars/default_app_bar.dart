import 'package:flutter/material.dart';
import 'package:naviquezon/src/core/themes/assets.gen.dart';

///{@template DefaultAppBar}
/// Custom app bar for the report screen
///{@endtemplate}
class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  ///{@macro DefaultAppBar}
  const DefaultAppBar({
    required this.onProfilePressed,
    super.key,
  });

  final void Function() onProfilePressed;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Align(
            child: Assets.images.logo.logoNavi.image(
              height: 34,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: onProfilePressed,
              child: Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Assets.images.icons.icAdmin.image(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
