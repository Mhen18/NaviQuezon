import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:naviquezon/src/core/themes/assets.gen.dart';
import 'package:naviquezon/src/core/utils/keys/route_keys.dart';
import 'package:naviquezon/src/core/widgets/buttons/rounded_button.dart';
import 'package:naviquezon/src/core/widgets/scaffolds/background_scaffold.dart';
import 'package:naviquezon/src/features/authentication/login/presentation/screens/login_screen.dart';
import 'package:naviquezon/src/features/authentication/registration/presentation/screens/registration_screen.dart';
import 'package:naviquezon/src/features/profile/presentation/screens/terms_and_conditions.dart';

///{@template SplashScreen}
/// Screen that display the initial page of the app.
///{@endtemplate}
class SplashScreen extends StatefulWidget {
  ///{@macro SplashScreen}
  const SplashScreen({super.key});

  static const route = rSplash;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

///{@template _SplashScreenState}
/// State for the [SplashScreen].
///{@endtemplate}
class _SplashScreenState extends State<SplashScreen> {
  bool _showButtons = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _showButtons = true;
      });
    });
  }

  /// Method to handle the account login button.
  ///
  void _onAccountLoginPressed() {
    context.push(LoginScreen.route);
  }

  /// Method to handle the account creation button.
  ///
  void _onAccountCreationPressed() {
    //  Navigate to the registration screen.
    context.push(RegistrationScreen.route);
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      foregroundColor: Colors.white.withValues(alpha: 0.5),
      body: (role) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Assets.images.logo.logoNavi.image(),
              if (_showButtons) ...[
                Column(
                  children: [
                    RoundedButton(
                      width: MediaQuery.of(context).size.width * 0.6,
                      onPressed: _onAccountLoginPressed,
                      label: 'Account Login',
                    ),
                    const Gap(16),
                    RoundedButton(
                      width: MediaQuery.of(context).size.width * 0.6,
                      onPressed: _onAccountCreationPressed,
                      label: 'Account Creation',
                    ),
                    GestureDetector(
                      onTap: () {
                        context.push(
                          TermsAndConditionsScreen.route,
                        );
                      },
                      child: const Text(
                        'About Terms and Conditions',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
