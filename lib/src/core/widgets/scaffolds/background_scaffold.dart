import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:naviquezon/src/core/blocs/app_role_cubit.dart';
import 'package:naviquezon/src/core/themes/assets.gen.dart';
import 'package:naviquezon/src/core/themes/styles/color_style.dart';
import 'package:naviquezon/src/core/utils/constants/enums/app_role_enums.dart';

///{@template BackgroundScaffold}
/// Custom scaffold widget with background image and foreground color.
///{@endtemplate}
class BackgroundScaffold extends StatelessWidget {
  ///{@macro BackgroundScaffold}
  const BackgroundScaffold({
    required this.body,
    super.key,
    this.backgroundImage,
    this.foregroundColor,
    this.canPop = true,
    this.onPopInvokedWithResult,
  }) : builder = null;

  ///{@macro BackgroundScaffold}
  const BackgroundScaffold.keyboard({
    required this.builder,
    super.key,
    this.backgroundImage,
    this.foregroundColor,
    this.canPop = true,
    this.onPopInvokedWithResult,
  }) : body = null;

  final Widget Function(AppRoleEnum)? body;
  final Widget Function(
    BuildContext,
    bool isKeyboardVisible,
    AppRoleEnum,
  )? builder;
  final String? backgroundImage;
  final Color? foregroundColor;
  final bool canPop;
  final void Function(bool, dynamic)? onPopInvokedWithResult;

  /// Getter for the background image.
  ///
  String get _backgroundImage {
    return backgroundImage ?? Assets.images.backgrounds.bgTour.keyName;
  }

  /// Getter for the foreground color.
  ///
  Color get _foregroundColor {
    return foregroundColor ?? color4E4E4E.withValues(alpha: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canPop,
      onPopInvokedWithResult: onPopInvokedWithResult,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              _backgroundImage,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            color: _foregroundColor,
          ),
          BlocBuilder<AppRoleCubit, AppRoleEnum>(
            builder: (context, roleState) {
              return Scaffold(
                backgroundColor: Colors.transparent,
                body: SizedBox(
                  width: double.infinity,
                  child: KeyboardVisibilityBuilder(
                    builder: (context, visible) {
                      if (builder != null) {
                        return builder!(context, visible, roleState);
                      }

                      if (body != null) {
                        return body!(roleState);
                      }

                      return const SizedBox();
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
