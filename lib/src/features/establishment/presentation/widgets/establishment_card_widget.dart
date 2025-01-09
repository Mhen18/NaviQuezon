import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/core/themes/styles/color_style.dart';
import 'package:naviquezon/src/core/themes/styles/text_style_default.dart';
import 'package:naviquezon/src/core/utils/extensions/datetime_extensions.dart';
import 'package:naviquezon/src/core/utils/extensions/num_extensions.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_model.dart';
import 'package:naviquezon/src/features/establishment/presentation/screens/establishment_details_screen.dart';
import 'package:naviquezon/src/features/establishment/presentation/screens/establishment_image_screen.dart';
import 'package:naviquezon/src/features/establishment/presentation/widgets/establishment_like_button.dart';
import 'package:naviquezon/src/features/profile/application/blocs/profile_get_cubit.dart';
import 'package:naviquezon/src/features/profile/domain/models/profile_model.dart';

///{@template EstablishmentCardWidget}
/// Widget to display the establishment card
///{@endtemplate}
class EstablishmentCardWidget extends StatefulWidget {
  ///{@macro EstablishmentCardWidget}
  const EstablishmentCardWidget({
    required EstablishmentModel establishment,
    super.key,
    void Function(bool isLike)? onLikePressed,
  })  : _establishment = establishment,
        _onLikePressed = onLikePressed,
        _isCreate = false;

  ///{@macro EstablishmentCardWidget.create}
  const EstablishmentCardWidget.create({
    required EstablishmentModel establishment,
    super.key,
    void Function(bool isLike)? onLikePressed,
  })  : _establishment = establishment,
        _onLikePressed = onLikePressed,
        _isCreate = true;

  final void Function(bool isLike)? _onLikePressed;
  final EstablishmentModel _establishment;
  final bool _isCreate;

  @override
  State<EstablishmentCardWidget> createState() =>
      _EstablishmentCardWidgetState();
}

class _EstablishmentCardWidgetState extends State<EstablishmentCardWidget> {
  /// Getter for the establishment model.
  ///
  EstablishmentModel get _establishment => widget._establishment;

  ProfileModel? get _profile {
    final profileState = BlocProvider.of<ProfileGetCubit>(context).state;
    if (profileState is CubitStateSuccess<ProfileModel>) {
      return profileState.value;
    }
    return null;
  }

  /// Getter for the plan date of added establishment.
  ///
  String get _planDate {
    if (widget._isCreate) {
      if (_profile != null) {
        final establishmentItinerary =
            _profile!.estaItinerary?.firstWhere((element) {
          return element.establishmentId == _establishment.id;
        });

        final planDate = establishmentItinerary?.planDate ??
            DateFormat('MMM dd, yyyy').format(DateTime.now());

        return planDate;
      }
    }

    return '';
  }

  /// Getter for the date of added establishment.
  ///
  String? get _createdDate {
    if (widget._isCreate) {
      if (_profile != null) {
        final establishmentItinerary =
            _profile!.estaItinerary?.firstWhere((element) {
          return element.establishmentId == _establishment.id;
        });

        final updatedDate = establishmentItinerary?.updatedDate ?? 0;

        if (updatedDate is num) {
          final date = updatedDate.toUnixTime();

          //  Convert the date to ago format.
          return 'Added: ${date.timeAgo()}';
        }
      }
    }

    return null;
  }

  /// Getter for the address of the establishment.
  ///
  String get _address {
    return _establishment.address;
  }

  /// Method to handle the see more button pressed.
  ///
  void _onSeeMorePressed() {
    context.push(
      EstablishmentDetailsScreen.route,
      extra: _establishment,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: colorD6E7FF,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          FittedBox(
            child: SizedBox(
              width: 130,
              child: InkWell(
                onTap: () {
                  context.push(
                    EstablishmentImageScreen.route,
                    extra: _establishment.thumbnail,
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: _establishment.thumbnail ?? '',
                    fit: BoxFit.cover,
                    height: 100,
                    width: 150,
                  ),
                ),
              ),
            ),
          ),
          const Gap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing:8,
                  children: [
                    Expanded(
                      child: Text(
                        _planDate,
                        style: textStyle12w600,
                      ),
                    ),

                  ],
                ),
                const Gap(8),
                Text(
                  widget._establishment.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: textStyle16w600,
                ),
                if (_createdDate != null) ...[
                  Text(
                    _createdDate!,
                    style: textStyle12w400,
                  ),
                ] else ...[
                  Text(
                    _address,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: textStyle12w400,
                  ),
                ],
                const Gap(16),
                Row(
                  children: [
                    Expanded(
                      child: EstablishmentLikeButton.label(
                        establishment: _establishment,
                        onLikePressed: widget._onLikePressed,
                      ),
                    ),
                    GestureDetector(
                      onTap: _onSeeMorePressed,
                      child: Text(
                        'See more...',
                        style: textStyle12w400.copyWith(
                          color: color1363DF,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
