import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/core/widgets/buttons/like_button.dart';
import 'package:naviquezon/src/core/widgets/snack_bars/app_snack_bar.dart';
import 'package:naviquezon/src/features/establishment/application/blocs/establishment_like_cubit.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_model.dart';
import 'package:naviquezon/src/features/profile/application/blocs/profile_get_cubit.dart';
import 'package:naviquezon/src/features/profile/domain/models/profile_model.dart';

///{@template LikeButton}
/// Custom widget for like button.
///{@endtemplate}
class EstablishmentLikeButton extends StatefulWidget {
  ///{@macro LikeButton}
  const EstablishmentLikeButton({
    required EstablishmentModel establishment,
    super.key,
    void Function(bool isLike)? onLikePressed,
  })  : _establishment = establishment,
        _onLikePressed = onLikePressed,
        _withLabel = false;

  ///{@macro LikeButton}
  const EstablishmentLikeButton.label({
    required EstablishmentModel establishment,
    super.key,
    void Function(bool isLike)? onLikePressed,
  })  : _establishment = establishment,
        _onLikePressed = onLikePressed,
        _withLabel = true;

  final void Function(bool isLike)? _onLikePressed;
  final EstablishmentModel _establishment;
  final bool _withLabel;

  @override
  State<EstablishmentLikeButton> createState() =>
      _EstablishmentLikeButtonState();
}

class _EstablishmentLikeButtonState extends State<EstablishmentLikeButton> {
  late ProfileGetCubit _profileCubit;
  final _likeCubit = EstablishmentLikeCubit();

  final _loading = ValueNotifier<bool>(false);
  bool _isLike = false;

  EstablishmentModel get _establishment => widget._establishment;

  @override
  void initState() {
    super.initState();

    _initBlocs();
  }

  /// Method to initialize the blocs/cubits.
  void _initBlocs() {
    _profileCubit = BlocProvider.of<ProfileGetCubit>(context);
    final profileState = _profileCubit.state;

    if (profileState is CubitStateSuccess<ProfileModel>) {
      final profile = profileState.value;
      final estaLike = profile.estaLike ?? [];

      _isLike = estaLike.contains(widget._establishment.id);
    }
  }

  /// Method to handle the like button pressed.
  ///
  void _onLikePressed(bool isLike) {
    if (_loading.value == true) return;

    //  Run the like cubit to save or remove the establishment to profile
    _likeCubit.run(
      establishmentId: _establishment.id,
      like: isLike,
    );

    widget._onLikePressed?.call(isLike);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _likeCubit,
      child: MultiBlocListener(
        listeners: [
          BlocListener<EstablishmentLikeCubit, CubitState>(
            listener: (context, likeState) {
              if (likeState is CubitStateLoading) {
                _loading.value = true;
              }

              if (likeState is CubitStateFailed) {
                _loading.value = false;

                final failure = likeState.failure;
                AppSnackBar.error(context, toast: true).show(failure.message);
              }

              if (likeState is CubitStateSuccess) {
                _profileCubit.run();
              }
            },
          ),
          BlocListener<ProfileGetCubit, CubitState>(
            bloc: _profileCubit,
            listener: (context, profileState) {
              if (profileState is CubitStateFailed) {
                _loading.value = false;

                final failure = profileState.failure;
                AppSnackBar.error(context, toast: true).show(failure.message);
              }

              if (profileState is CubitStateSuccess<ProfileModel>) {
                _loading.value = false;

                setState(() {
                  final profile = profileState.value;
                  final estaLike = profile.estaLike ?? [];

                  _isLike = estaLike.contains(widget._establishment.id);
                });
              }
            },
          ),
        ],
        child: widget._withLabel
            ? LikeButton.label(
                onLikePressed: _onLikePressed,
                isLiked: _isLike,
              )
            : LikeButton(
                onLikePressed: _onLikePressed,
                isLiked: _isLike,
              ),
      ),
    );
  }
}
