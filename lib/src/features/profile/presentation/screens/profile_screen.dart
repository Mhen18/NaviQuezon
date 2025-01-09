import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/core/themes/assets.gen.dart';
import 'package:naviquezon/src/core/themes/styles/color_style.dart';
import 'package:naviquezon/src/core/themes/styles/text_style_default.dart';
import 'package:naviquezon/src/core/utils/constants/enums/gender_enums.dart';
import 'package:naviquezon/src/core/utils/keys/route_keys.dart';
import 'package:naviquezon/src/core/widgets/containers/profile_image_container.dart';
import 'package:naviquezon/src/features/authentication/splash/presentation/screens/splash_screen.dart';
import 'package:naviquezon/src/features/establishment/presentation/screens/establishment_like_screen.dart';
import 'package:naviquezon/src/features/establishment/presentation/screens/establishment_reviews_screen.dart';
import 'package:naviquezon/src/features/profile/application/blocs/profile_get_cubit.dart';
import 'package:naviquezon/src/features/profile/domain/models/profile_model.dart';

///{@template ProfileScreen}
/// Screen that display the user role profile.
///{@endtemplate}
class ProfileScreen extends StatefulWidget {
  ///{@macro ProfileScreen}
  const ProfileScreen({super.key});

  static const route = rProfile;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ProfileGetCubit _profileCubit;

  /// Getter for the image placeholder.
  ///
  String get _imagePlaceholder {
    return Assets.images.icons.icUser.keyName;
  }

  @override
  void initState() {
    super.initState();

    _initBlocs();
  }

  /// Method to initialize the blocs/cubits.
  void _initBlocs() {
    _profileCubit = BlocProvider.of<ProfileGetCubit>(context);

    _profileCubit.run();
  }

  /// Method to handle the logout button pressed.
  ///
  void _onLogoutPressed() {
    context.go(SplashScreen.route);
  }

  /// Method to handle the my likes button pressed.
  ///
  void _onMyLikesPressed() {
    context.push(EstablishmentLikeScreen.route);
  }

  /// Method to handle the my reviews button pressed.
  ///
  void _onMyReviewsPressed() {
    context.push(EstablishmentReviewsScreen.route);
  }

  /// Method to handle the edit profile button pressed.
  ///
  void _onEditProfilePressed() {
    context.push(rProfileEdit);
  }

  /// Method to handle the edit password button pressed.
  ///
  void _onEditPasswordPressed() {
    context.push(rProfilePassword);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<ProfileGetCubit, CubitState>(
        builder: (context, profileState) {
          if (profileState is CubitStateLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (profileState is CubitStateFailed) {
            final failure = profileState.failure;

            return Center(
              child: Text(failure.message),
            );
          }

          if (profileState is CubitStateSuccess<ProfileModel>) {
            final profile = profileState.value;

            return SafeArea(
              child: Container(
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: colorD6E7FF,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 65),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Assets.images.headers.headerProfileDrawer
                                  .image(
                                height: 180,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: ProfileImageContainer(
                              imagePlaceHolder: _imagePlaceholder,
                              imageUrl: profile.image,
                              size: 130,
                            ),
                          ),
                        ],
                      ),
                      const Gap(16),
                      Expanded(
                        child: SingleChildScrollView(
                          child: _ProfileInfo(
                            onMyLikesPressed: _onMyLikesPressed,
                            onMyReviewsPressed: _onMyReviewsPressed,
                            onEditProfilePressed: _onEditProfilePressed,
                            onEditPasswordPressed: _onEditPasswordPressed,
                            onLogoutPressed: _onLogoutPressed,
                            profile: profile,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Assets.images.logo.logoNavi.image(
                          height: 28,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}

///{@template _ProfileInfo}
/// Custom widget that display the profile info.
///{@endtemplate}
class _ProfileInfo extends StatelessWidget {
  ///{@macro _ProfileInfo}
  const _ProfileInfo({
    required void Function() onMyLikesPressed,
    required void Function() onMyReviewsPressed,
    required void Function() onEditProfilePressed,
    required void Function() onEditPasswordPressed,
    required void Function() onLogoutPressed,
    required ProfileModel profile,
  })  : _profile = profile,
        _onMyLikesPressed = onMyLikesPressed,
        _onMyReviewsPressed = onMyReviewsPressed,
        _onEditProfilePressed = onEditProfilePressed,
        _onEditPasswordPressed = onEditPasswordPressed,
        _onLogoutPressed = onLogoutPressed;

  final void Function() _onMyLikesPressed;
  final void Function() _onMyReviewsPressed;
  final void Function() _onEditProfilePressed;
  final void Function() _onEditPasswordPressed;
  final void Function() _onLogoutPressed;
  final ProfileModel _profile;

  /// Getter for the profile name.
  ///
  String get _profileName => '${_profile.firstName} ${_profile.lastName}';

  /// Getter for the profile's gender.
  ///
  String get _profileGender {
    final gender = GenderEnums.fromString(_profile.gender);

    return gender.value;
  }

  /// Getter for the profile's address.
  String? get _profileAddress {
    final municipality = _profile.municipality;
    final province = _profile.province;

    //  Check if the municipality and province are both null.
    if (municipality == null && province == null) {
      return null;
    }

    //  Check if the municipality is null.
    if (municipality == null) {
      return province;
    }

    //  Check if the province is null.
    return '$municipality, $province';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          _profileName,
          style: textStyle14w600,
        ),
        const Gap(16),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Text(
                    _profile.age.toString(),
                    textAlign: TextAlign.center,
                  ),
                ),
                if (_profile.gender != null) ...[
                  const VerticalDivider(),
                  Expanded(
                    child: Text(
                      _profileGender,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
                if (_profileAddress != null) ...[
                  const VerticalDivider(),
                  Expanded(
                    child: Text(
                      _profileAddress ?? 'N/A',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
        const Gap(16),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              _ProfileButton(
                onPressed: _onMyLikesPressed,
                label: 'My Likes',
                icon: Icons.favorite,
              ),
              const Gap(4),
              _ProfileButton(
                onPressed: _onMyReviewsPressed,
                label: 'My Reviews',
                icon: Icons.reviews,
              ),
              const Gap(4),
              _ProfileButton(
                onPressed: _onEditProfilePressed,
                label: 'Edit Profile',
                icon: Icons.account_circle,
              ),
              const Gap(4),
              _ProfileButton(
                onPressed: _onEditPasswordPressed,
                label: 'Edit Password',
                icon: Icons.password,
              ),
              const Gap(4),
              _ProfileButton(
                onPressed: _onLogoutPressed,
                label: 'Logout',
                icon: Icons.logout,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

///{@template _ProfileButton}
/// Custom widget that display the profile buttons.
///{@endtemplate}
class _ProfileButton extends StatelessWidget {
  ///{@macro _ProfileButton}
  const _ProfileButton({
    required this.onPressed,
    required this.label,
    required this.icon,
  });

  final void Function() onPressed;
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        shape: const RoundedRectangleBorder(),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.black87,
          ),
          const Gap(8),
          Expanded(
            child: Text(label),
          ),
          const Gap(8),
          const Icon(
            Icons.keyboard_arrow_right,
            color: Colors.black87,
          ),
        ],
      ),
    );
  }
}
