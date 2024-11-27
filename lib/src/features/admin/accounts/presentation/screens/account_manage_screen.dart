import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/core/blocs/municipality_list_get_cubit.dart';
import 'package:naviquezon/src/core/utils/keys/route_keys.dart';
import 'package:naviquezon/src/core/utils/keys/string_keys.dart';
import 'package:naviquezon/src/core/widgets/buttons/rounded_button.dart';
import 'package:naviquezon/src/core/widgets/containers/error_state_container.dart';
import 'package:naviquezon/src/core/widgets/dialogs/loading_dialog.dart';
import 'package:naviquezon/src/core/widgets/dropdowns/municipality_dropdown.dart';
import 'package:naviquezon/src/core/widgets/snack_bars/app_snack_bar.dart';
import 'package:naviquezon/src/core/widgets/text_fields/rounded_text_field.dart';
import 'package:naviquezon/src/features/admin/accounts/application/blocs/account_add_cubit.dart';
import 'package:naviquezon/src/features/admin/accounts/application/blocs/account_delete_cubit.dart';
import 'package:naviquezon/src/features/admin/accounts/application/blocs/account_list_get_cubit.dart';
import 'package:naviquezon/src/features/admin/accounts/domain/failures/account_invite_failure.dart';
import 'package:naviquezon/src/features/admin/accounts/domain/models/admin_add_model.dart';
import 'package:naviquezon/src/features/authentication/registration/domain/models/municipality_model.dart';
import 'package:naviquezon/src/features/profile/domain/models/profile_model.dart';

///{@template AccountManageScreen}
/// Screen that display and handle the admin accounts.
///{@endtemplate}
class AccountManageScreen extends StatefulWidget {
  ///{macro AccountManageScreen}
  const AccountManageScreen({super.key});

  static const route = rManageAccount;

  @override
  State<AccountManageScreen> createState() => _ScreenState();
}

class _ScreenState extends State<AccountManageScreen> {
  final _accountListCubit = AccountListGetCubit();
  final _accountDeleteCubit = AccountDeleteCubit();

  @override
  void initState() {
    super.initState();

    _initBlocs();
  }

  /// Method to initialize the blocs/cubits.
  ///
  void _initBlocs() {
    _accountListCubit.run();
  }

  /// Method to handle the add account button.
  ///
  void _onSetupAccountPressed({ProfileModel? profile}) {
    showModalBottomSheet<_AccountSetupBottomSheet>(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return _AccountSetupBottomSheet(
          onSuccess: _initBlocs,
          profile: profile,
        );
      },
    );
  }

  /// Method to handle the delete button.
  ///
  void _onDeletePressed(String id) {
    _accountDeleteCubit.run(id);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => _accountListCubit,
        ),
        BlocProvider(
          create: (context) => _accountDeleteCubit,
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Manage Accounts'),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: _onSetupAccountPressed,
            ),
          ],
        ),
        body: BlocListener<AccountDeleteCubit, CubitState>(
          listener: (context, deleteState) {
            if (deleteState is CubitStateLoading) {
              LoadingDialog.show(context);
            }
            if (deleteState is CubitStateFailed) {
              LoadingDialog.hide(context);

              final failure = deleteState.failure;
              AppSnackBar.error(context).show(failure.message);
            }
            if (deleteState is CubitStateSuccess) {
              LoadingDialog.hide(context);

              //  Call the success callback
              _initBlocs();

              //  Show success message
              AppSnackBar.success(context).show('Account deleted successfully');
            }
          },
          child: BlocBuilder<AccountListGetCubit, CubitState>(
            builder: (context, accountState) {
              if (accountState is CubitStateLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (accountState is CubitStateFailed) {
                final failure = accountState.failure;

                return ErrorStateContainer(
                  message: failure.message,
                  onPressed: _initBlocs,
                );
              }

              if (accountState is CubitStateSuccess<List<ProfileModel>>) {
                final accountList = accountState.value;

                if (accountList.isEmpty) {
                  return const Center(
                    child: Text('No accounts found'),
                  );
                }

                return ListView.separated(
                  itemCount: accountList.length,
                  padding: const EdgeInsets.all(16),
                  separatorBuilder: (context, index) => const Gap(12),
                  itemBuilder: (context, index) {
                    final profile = accountList[index];

                    return _AccountCardWidget(
                      onDeletePressed: () => _onDeletePressed(profile.id),
                      profile: profile,
                    );
                  },
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}

///{@template _AccountCardWidget}
/// Widget to display the account info.
///{@endtemplate}
class _AccountCardWidget extends StatelessWidget {
  ///{macro _AccountCardWidget}
  const _AccountCardWidget({
    required void Function() onDeletePressed,
    required ProfileModel profile,
  })  : _onDeletePressed = onDeletePressed,
        _profile = profile;

  final void Function() _onDeletePressed;
  final ProfileModel _profile;

  /// Getter to get the name of the profile.
  ///
  String get _name {
    final firstName = _profile.firstName;
    final lastName = _profile.lastName;

    return '$firstName $lastName';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name: $_name'),
                Text('Email: ${_profile.email}'),
                Text('Municipality: ${_profile.municipality}'),
              ],
            ),
          ),
          const Gap(8),
          InkWell(
            onTap: _onDeletePressed,
            child: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}

///{@template _AccountAddBottomSheet}
/// Custom bottom sheet to add an account.
///{@endtemplate}
class _AccountSetupBottomSheet extends StatefulWidget {
  ///{macro _AccountAddBottomSheet}
  const _AccountSetupBottomSheet({
    required void Function() onSuccess,
    ProfileModel? profile,
  })  : _onSuccess = onSuccess,
        _profile = profile;

  final void Function() _onSuccess;
  final ProfileModel? _profile;

  @override
  State<_AccountSetupBottomSheet> createState() => _BottomSheetState();
}

class _BottomSheetState extends State<_AccountSetupBottomSheet> {
  final _adminAddCubit = AccountAddCubit();
  final _municipalityCubit = MunicipalityListGetCubit();

  final _municipality = ValueNotifier<MunicipalityModel?>(null);

  final _fNameController = TextEditingController();
  final _lNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  /// Getter if the form is valid.
  bool get _valid {
    final municipality = _municipality.value?.name;
    final fName = _fNameController.text;
    final lName = _lNameController.text;
    final email = _emailController.text;
    final phone = _phoneController.text;

    if (widget._profile != null) {
      final validFName = fName != widget._profile?.firstName;
      final validLName = lName != widget._profile?.lastName;
      final validEmail = email != widget._profile?.email;
      final validPhone = phone != widget._profile?.phone;
      final validMunicipality = municipality != widget._profile?.municipality;

      return validFName ||
          validLName ||
          validEmail ||
          validPhone ||
          validMunicipality;
    }

    return fName.isNotEmpty &&
        lName.isNotEmpty &&
        email.isNotEmpty &&
        phone.isNotEmpty &&
        municipality != null;
  }

  @override
  void initState() {
    super.initState();

    _municipalityCubit.run(sQuezonProvinceCode);
  }

  /// Method to handle the field changes.
  ///
  void _onFieldChanged(String? value) {
    setState(() {});
  }

  /// Method to handle the municipality changes.
  ///
  void _onMunicipalityChanged(MunicipalityModel? value) {
    setState(() {
      _municipality.value = value;
    });
  }

  /// Method to handle the save button.
  ///
  void _onSavePressed() {
    final municipality = _municipality.value?.name ?? 'Sariaya';
    final fName = _fNameController.text;
    final lName = _lNameController.text;
    final email = _emailController.text;
    final phone = _phoneController.text;

    final admin = AdminAddModel(
      municipality: municipality,
      email: email,
      firstName: fName,
      lastName: lName,
      phone: phone,
    );

    _adminAddCubit.run(admin);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => _adminAddCubit,
        ),
        BlocProvider(
          create: (context) => _municipalityCubit,
        ),
      ],
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: BlocListener<AccountAddCubit, CubitState>(
          listener: (context, addState) {
            if (addState is CubitStateLoading) {
              LoadingDialog.show(context);
            }
            if (addState is CubitStateFailed) {
              LoadingDialog.hide(context);

              final failure = addState.failure;

              //  Show error message
              AppSnackBar.error(context, toast: true).show(failure.message);

              //  Check if the failure is an invite failure
              if (failure is AccountInviteFailure) {
                //  Call the success callback
                widget._onSuccess();

                //  Close the bottom sheet
                context.pop();
              }
            }
            if (addState is CubitStateSuccess) {
              LoadingDialog.hide(context);

              //  Show success message
              AppSnackBar.success(context).show('Account added successfully');

              //  Call the success callback
              widget._onSuccess();

              //  Close the bottom sheet
              context.pop();
            }
          },
          child: BlocConsumer<MunicipalityListGetCubit, CubitState>(
            listener: (context, municipalityState) {
              if (municipalityState is CubitStateSuccess) {
                final value = municipalityState.value;
                final list = value as List<MunicipalityModel>;

                if (widget._profile != null) {
                  final municipality = list.firstWhere(
                    (element) => element.name == widget._profile?.municipality,
                    orElse: () => list.first,
                  );

                  setState(() {
                    _municipality.value = municipality;
                  });
                }
              }
            },
            builder: (context, municipalityState) {
              if (municipalityState is CubitStateLoading) {
                return const Wrap(
                  children: [
                    Center(child: CircularProgressIndicator()),
                  ],
                );
              }

              if (municipalityState is CubitStateFailed) {
                return ErrorStateContainer(
                  message: municipalityState.failure.message,
                  onPressed: () => _municipalityCubit.run(
                    sQuezonProvinceCode,
                  ),
                );
              }

              if (municipalityState is CubitStateSuccess) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        MunicipalityDropdown(
                          onChanged: _onMunicipalityChanged,
                          value: _municipality.value,
                          bloc: _municipalityCubit,
                        ),
                        const Gap(16),
                        RoundedTextField(
                          controller: _fNameController,
                          onChanged: _onFieldChanged,
                          label: 'First Name',
                        ),
                        const Gap(16),
                        RoundedTextField(
                          controller: _lNameController,
                          onChanged: _onFieldChanged,
                          label: 'Last Name',
                        ),
                        const Gap(16),
                        RoundedTextField(
                          controller: _emailController,
                          onChanged: _onFieldChanged,
                          label: 'Email',
                        ),
                        const Gap(16),
                        RoundedTextField(
                          controller: _phoneController,
                          onChanged: _onFieldChanged,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          label: 'Phone Number',
                        ),
                        const Gap(16),
                        RoundedButton(
                          onPressed: _valid ? _onSavePressed : null,
                          label: 'Save',
                        ),
                      ],
                    ),
                  ),
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
