import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/core/themes/styles/text_style_default.dart';
import 'package:naviquezon/src/core/utils/keys/route_keys.dart';
import 'package:naviquezon/src/core/widgets/buttons/rounded_button.dart';
import 'package:naviquezon/src/features/admin/verification/application/blocs/get_verification_list_cubit.dart';
import 'package:naviquezon/src/features/admin/verification/domain/verification_sort_enum.dart';
import 'package:naviquezon/src/features/admin/verification/presentation/verification_details_screen.dart';
import 'package:naviquezon/src/features/profile/domain/models/profile_model.dart';

///{@template VerificationScreen}
/// Screen for the admin to verify the account registration.
///{@endtemplate}
class VerificationScreen extends StatefulWidget {
  ///{@macro VerificationScreen}
  const VerificationScreen({super.key});

  static const route = rVerification;

  @override
  State<VerificationScreen> createState() => _ScreenState();
}

class _ScreenState extends State<VerificationScreen> {
  final _verificationCubit = GetVerificationListCubit();

  VerificationSortEnum _currentSort = VerificationSortEnum.createdDate;

  @override
  void initState() {
    super.initState();

    //  Call the cubit initialization
    _initBlocs();
  }

  /// Method to initialize the blocs/cubits.
  ///
  void _initBlocs() {
    _verificationCubit.run(_currentSort);
  }

  /// Method to handle the sort button pressed.
  ///
  void _onSortPressed() {
    //  Show the bottom sheet for adding/editing the faq
    showModalBottomSheet<_VerificationSortBottomSheet>(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return _VerificationSortBottomSheet(
          onByDatePressed: _onSortByDatePressed,
          onByEmailPressed: _onSortByEmailPressed,
          currentSort: _currentSort,
        );
      },
    );
  }

  /// Method to handle the sort by email pressed.
  ///
  void _onSortByEmailPressed() {
    _onSort(VerificationSortEnum.email);
  }

  /// Method to handle the sort by date pressed.
  ///
  void _onSortByDatePressed() {
    _onSort(VerificationSortEnum.createdDate);
  }

  void _onSort(VerificationSortEnum sort){
    context.pop();

    setState(() {
      _currentSort = sort;
    });

    //  Call the cubit to get the verification list
    _verificationCubit.run(sort);
  }

  /// Method to handle the profile card pressed.
  ///
  Future<void> _onCardPressed(ProfileModel profile) async {
    //  Navigate to the verification details screen and get the result if
    //  the account is approved or not
    final isApproved = await context.push(
      VerificationDetailsScreen.route,
      extra: VerificationDetailsParams(
        profile: profile,
      ),
    );

    //  Check if the account is approved
    if (isApproved != null) {
      if (isApproved == true) {
        //  Refresh the verification list
        await _verificationCubit.run(_currentSort);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _verificationCubit,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('For Verification'),
          actions: [
            IconButton(
              icon: const Icon(Icons.sort),
              onPressed: _onSortPressed,
            ),
          ],
        ),
        body: BlocBuilder<GetVerificationListCubit, CubitState>(
          builder: (context, state) {
            if (state is CubitStateLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CubitStateFailed) {
              return Center(
                child: Text(state.failure.message),
              );
            } else if (state is CubitStateSuccess<List<ProfileModel>>) {
              final profileList = state.value;

              if (profileList.isEmpty) {
                return const Center(
                  child: Text('No account to verify'),
                );
              }

              return ListView.separated(
                itemCount: profileList.length,
                padding: const EdgeInsets.all(16),
                separatorBuilder: (context, index) => const Gap(8),
                itemBuilder: (context, index) {
                  final profile = profileList[index];

                  return _VerificationAccountCard(
                    onPressed: () => _onCardPressed(profile),
                    profile: profile,
                  );
                },
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}

///{@template _VerificationAccountCard}
/// Card to display the account to verify.
///{@endtemplate}
class _VerificationAccountCard extends StatelessWidget {
  ///{@macro _VerificationAccountCard}
  const _VerificationAccountCard({
    required this.onPressed,
    required this.profile,
  });

  final ProfileModel profile;
  final void Function() onPressed;

  /// Getter to get the name of the profile.
  ///
  String get _name => '${profile.firstName} ${profile.lastName}';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_name),
                    const Gap(4),
                    Text(
                      profile.email,
                      style: textStyle10w400.copyWith(
                        color: Colors.grey[800],
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(8),
              const Icon(Icons.keyboard_arrow_right),
            ],
          ),
        ),
      ),
    );
  }
}

///{@template _VerificationSortBottomSheet}
/// Bottom sheet to sort the verification list.
///{@endtemplate}
class _VerificationSortBottomSheet extends StatelessWidget {
  ///{@macro _VerificationSortBottomSheet}
  const _VerificationSortBottomSheet({
    required void Function() onByDatePressed,
    required void Function() onByEmailPressed,
    required VerificationSortEnum currentSort,
  })  : _onByEmailPressed = onByEmailPressed,
        _onByDatePressed = onByDatePressed,
        _currentSort = currentSort;

  final void Function() _onByDatePressed;
  final void Function() _onByEmailPressed;
  final VerificationSortEnum _currentSort;

  /// Getter to check if the current sort is by date.
  ///
  bool get _isByDate => _currentSort == VerificationSortEnum.createdDate;

  /// Getter to check if the current sort is by email.
  ///
  bool get _isByEmail => _currentSort == VerificationSortEnum.email;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 24,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RoundedButton(
              onPressed: _isByDate ? null : _onByDatePressed,
              width: double.infinity,
              label: 'By Date',
            ),
            const Gap(12),
            RoundedButton(
              onPressed: _isByEmail ? null : _onByEmailPressed,
              width: double.infinity,
              label: 'By Email',
            ),
          ],
        ),
      ),
    );
  }
}
