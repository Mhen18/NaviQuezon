import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:naviquezon/src/core/themes/assets.gen.dart';
import 'package:naviquezon/src/core/themes/styles/color_style.dart';
import 'package:naviquezon/src/core/themes/styles/text_style_default.dart';
import 'package:naviquezon/src/core/utils/constants/enums/app_role_enums.dart';
import 'package:naviquezon/src/core/widgets/buttons/rounded_button.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_model.dart';
import 'package:naviquezon/src/features/establishment/presentation/widgets/establishment_details/establishment_details_info/establishment_info_amenities.dart';
import 'package:naviquezon/src/features/establishment/presentation/widgets/establishment_details/establishment_details_info/establishment_info_overview.dart';
import 'package:naviquezon/src/features/establishment/presentation/widgets/establishment_details/establishment_details_info/establishment_info_reviews.dart';

///{@template EstablishmentDetailsInfo}
/// Custom widget that display the amenities details info
///{@endtemplate}
class EstablishmentDetailsInfo extends StatefulWidget {
  ///{@macro EstablishmentDetailsInfo}
  const EstablishmentDetailsInfo({
    required double imageHeight,
    required EstablishmentModel establishment,
    super.key,
  })  : _imageHeight = imageHeight,
        _establishment = establishment,
        _onEditInfoPressed = null,
        _role = AppRoleEnum.user;

  ///{@macro EstablishmentDetailsInfo.owner}
  const EstablishmentDetailsInfo.owner({
    required void Function() onEditInfoPressed,
    required double imageHeight,
    required EstablishmentModel establishment,
    super.key,
  })  : _imageHeight = imageHeight,
        _establishment = establishment,
        _onEditInfoPressed = onEditInfoPressed,
        _role = AppRoleEnum.owner;

  final void Function()? _onEditInfoPressed;
  final EstablishmentModel _establishment;
  final double _imageHeight;
  final AppRoleEnum _role;

  @override
  State<EstablishmentDetailsInfo> createState() =>
      _EstablishmentDetailsInfoState();
}

class _EstablishmentDetailsInfoState extends State<EstablishmentDetailsInfo> {
  /// Getter for the establishment model
  ///
  EstablishmentModel get _establishment => widget._establishment;

  /// Getter for the categories of the establishment
  ///
  String get _categories => _establishment.categories.join(', ');


  /// Getter for the ratings.
  ///
  String? get _ratings {
    final rating = _establishment.rating;

    if(rating != null){
      return rating.toStringAsFixed(1);
    }

    return null;
  }

  /// Method to handle the see description button pressed
  ///
  void _onSeeDescriptionPressed() {
    showDialog<Widget>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Descriptions'),
          titleTextStyle: textStyle16w600,
          contentTextStyle: textStyle14w400,
          content: Text(_establishment.description ?? ''),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: widget._imageHeight - 16),
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: colorF1FBFF,
        border: Border.fromBorderSide(
          BorderSide(),
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _establishment.name,
                      style: textStyle16w600,
                    ),
                    if (_ratings != null) ...[
                      _InfoIconText(
                        icon: Assets.images.icons.amenities.icRate.keyName,
                        label: _ratings ?? '',
                      ),
                    ],
                    _InfoIconText(
                      icon: Assets.images.icons.amenities.icHotel.keyName,
                      label: _categories,
                    ),
                    _InfoIconText(
                      icon: Assets.images.icons.amenities.icLocation.keyName,
                      label: _establishment.address,
                    ),
                    _InfoIconText.icon(
                      iconData: Icons.phone,
                      label: _establishment.contactNumber,
                    ),
                    if (_establishment.description != null) ...[
                      const Gap(8),
                      InkWell(
                        onTap: _onSeeDescriptionPressed,
                        child: Text(
                          'See Descriptions',
                          style: textStyle14w400.copyWith(
                            color: color1363DF,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              Expanded(
                child: DefaultTabController(
                  length: 3,
                  child: Column(
                    children: [
                      TabBar(
                        labelStyle:
                            textStyle14w600.copyWith(color: color1363DF),
                        tabs: const [
                          Tab(text: 'Amenities'),
                          Tab(text: 'Reviews'),
                          Tab(text: 'Overview'),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            EstablishmentInfoAmenities(
                              amenities: _establishment.amenities ?? [],
                            ),
                            EstablishmentInfoReviews(
                              establishmentId: _establishment.id,
                            ),
                            EstablishmentInfoOverview(
                              reportList: _establishment.report ?? [],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (widget._role == AppRoleEnum.owner) ...[
                RoundedButton(
                  onPressed: widget._onEditInfoPressed,
                  margin: const EdgeInsets.only(top: 16),
                  width: double.infinity,
                  label: 'Edit Information',
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

///{@template _InfoIconText}
/// Custom widget that display the info icon text
///{@endtemplate}
class _InfoIconText extends StatelessWidget {
  ///{@macro _InfoIconText}
  const _InfoIconText({
    required String icon,
    required String label,
  })  : _label = label,
        _icon = icon,
        _iconData = null;

  ///{@macro _InfoIconText}
  const _InfoIconText.icon({
    required IconData iconData,
    required String label,
  })  : _label = label,
        _iconData = iconData,
        _icon = null;

  final String? _icon;
  final IconData? _iconData;
  final String _label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (_icon != null) ...[
          SizedBox(
            height: 15,
            width: 15,
            child: Image.asset(
              _icon,
              color: color1363DF,
            ),
          ),
          const Gap(8),
        ],
        if (_iconData != null) ...[
          SizedBox(
            height: 15,
            width: 15,
            child: Icon(
              _iconData,
              color: color1363DF,
              size: 15,
            ),
          ),
          const Gap(8),
        ],
        Expanded(
          child: Text(
            _label,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
