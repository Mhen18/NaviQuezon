import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/core/themes/assets.gen.dart';
import 'package:naviquezon/src/core/themes/styles/color_style.dart';
import 'package:naviquezon/src/core/themes/styles/text_style_default.dart';
import 'package:naviquezon/src/core/utils/constants/enums/app_role_enums.dart';
import 'package:naviquezon/src/core/widgets/drawers/default_drawer/default_drawer_button.dart';
import 'package:naviquezon/src/core/widgets/drawers/default_drawer/default_drawer_header.dart';
import 'package:naviquezon/src/features/profile/application/blocs/profile_get_cubit.dart';
import 'package:naviquezon/src/features/profile/domain/models/profile_model.dart';

///{@template DefaultDrawer}
/// Custom widget that display the drawer of the report screen
///{@endtemplate}
class DefaultDrawer extends StatefulWidget {
  ///{@macro DefaultDrawer}
  const DefaultDrawer({
    required this.buttonList,
    super.key,
  });

  final List<DefaultDrawerButton> buttonList;

  @override
  State<DefaultDrawer> createState() => _DefaultDrawerState();
}

class _DefaultDrawerState extends State<DefaultDrawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
          ),
        ),
        backgroundColor: colorD6E7FF,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const DefaultDrawerHeader(),
                const Gap(24),
                BlocBuilder<ProfileGetCubit, CubitState>(
                  builder: (context, profileState) {
                    if (profileState is CubitStateSuccess<ProfileModel>) {
                      final profile = profileState.value;
                      final fName = profile.firstName;
                      final lName = profile.lastName;
                      final name = '$fName $lName';

                      final role = AppRoleEnum.fromString(profile.role);

                      return Column(
                        children: [
                          Text(
                            name,
                            style: textStyle16w600,
                          ),
                          if (role == AppRoleEnum.admin) ...[
                            Text(
                              role.value,
                              style: textStyle14w400,
                            ),
                          ],
                        ],
                      );
                    }

                    return const SizedBox();
                  },
                ),
                const Gap(24),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: widget.buttonList,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Assets.images.logo.logoNavi.image(
                height: 34,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
