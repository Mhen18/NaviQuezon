import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/core/blocs/app_role_cubit.dart';
import 'package:naviquezon/src/core/themes/assets.gen.dart';
import 'package:naviquezon/src/core/utils/constants/enums/app_role_enums.dart';
import 'package:naviquezon/src/core/widgets/containers/profile_image_container.dart';
import 'package:naviquezon/src/core/widgets/drawers/default_drawer/default_drawer.dart';
import 'package:naviquezon/src/features/profile/application/blocs/profile_get_cubit.dart';
import 'package:naviquezon/src/features/profile/domain/models/profile_model.dart';

///{@template DefaultDrawerHeader}
/// Drawer header for the [DefaultDrawer].
///{@endtemplate}
class DefaultDrawerHeader extends StatefulWidget {
  ///{@macro DefaultDrawerHeader}
  const DefaultDrawerHeader({super.key});

  @override
  State<DefaultDrawerHeader> createState() => _DefaultDrawerHeaderState();
}

class _DefaultDrawerHeaderState extends State<DefaultDrawerHeader> {
  /// Getter for the role of the user
  ///
  AppRoleEnum get _role {
    final role = context.read<AppRoleCubit>().state;

    return role;
  }

  String get _imagePlaceholder {
    switch (_role) {
      case AppRoleEnum.superAdmin:
      case AppRoleEnum.admin:
        return Assets.images.icons.icAdmin.keyName;
      case AppRoleEnum.owner:
        return Assets.images.icons.icOwner.keyName;
      case AppRoleEnum.user:
        return Assets.images.icons.icUser.keyName;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                  child: Assets.images.headers.headerProfileDrawer.image(
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 165,
                  ),
                ),
                const Gap(165 / 4),
              ],
            ),
            BlocBuilder<ProfileGetCubit, CubitState>(
              builder: (context, profileState) {
                if(profileState is CubitStateSuccess<ProfileModel>){
                  final profile = profileState.value;
                  final image = profile.image;

                  return Align(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: ProfileImageContainer(
                      imagePlaceHolder: _imagePlaceholder,
                      imageUrl: image,
                    ),
                  );
                }

                return Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: ProfileImageContainer(
                    imagePlaceHolder: _imagePlaceholder,
                  ),
                  // child: Container(
                  //   height: 100,
                  //   width: 100,
                  //   padding: const EdgeInsets.all(3),
                  //   decoration: const BoxDecoration(
                  //     shape: BoxShape.circle,
                  //     color: Colors.white,
                  //   ),
                  //   child: Container(
                  //     decoration: const BoxDecoration(
                  //       color: Colors.black87,
                  //       shape: BoxShape.circle,
                  //     ),
                  //     child: _image,
                  //   ),
                  // ),
                );
              },
            ),
          ],
        ),
        Align(
          alignment: AlignmentDirectional.topStart,
          child: IconButton(
            onPressed: context.pop,
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
