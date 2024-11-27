import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:naviquezon/src/core/themes/styles/text_style_default.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_amenity_model.dart';

///{@template EstablishmentInfoAmenities}
/// Custom widget that display the amenities details of the establishment.
///{@endtemplate}
class EstablishmentInfoAmenities extends StatelessWidget {
  ///{@macro EstablishmentInfoAmenities}
  const EstablishmentInfoAmenities({
    required List<EstablishmentAmenityModel> amenities,
    super.key,
  }) : _amenities = amenities;

  final List<EstablishmentAmenityModel> _amenities;

  /// Getter for the popular amenities.
  ///
  List<EstablishmentAmenityModel> get _popularAmenities {
    return _amenities.where((e) {
      final isPopular = e.isPopular ?? false;

      return isPopular == true;
    }).toList();
  }

  /// Getter for the common amenities.
  ///
  List<EstablishmentAmenityModel> get _commonAmenities {
    return _amenities.where((e) {
      final isPopular = e.isPopular ?? false;
      return isPopular == false;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    if (_amenities.isEmpty) {
      return Center(
        child: Text(
          'No amenities available',
          style: textStyle14w400,
        ),
      );
    }

    return SingleChildScrollView(
      child: Builder(
        builder: (context) {
          //  Check if the amenities is empty.
          if (_commonAmenities.isEmpty && _popularAmenities.isEmpty) {
            return Center(
              child: Text(
                'No amenities available',
                style: textStyle14w400,
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (_popularAmenities.isNotEmpty) ...[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Popular Amenities',
                        style: textStyle14w500,
                      ),
                      const Gap(8),
                      Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        children: _popularAmenities.map((amenity) {
                          return _InfoAmenitiesWidget(
                            label: amenity.name,
                            isFree: amenity.isFree ?? false,
                          );
                        }).toList(),
                      ),
                      const Divider(
                        height: 32,
                        color: Colors.black87,
                      ),
                    ],
                  ),
                ],
                if (_commonAmenities.isNotEmpty) ...[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Other Amenities',
                        style: textStyle14w500,
                      ),
                      const Gap(8),
                      Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        children: _commonAmenities.map((amenity) {
                          return _InfoAmenitiesWidget(
                            label: amenity.name,
                            isFree: amenity.isFree ?? false,
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}

///{@template _InfoAmenitiesPopular}
/// Custom widget for the amenities.
///{@endtemplate}
class _InfoAmenitiesWidget extends StatelessWidget {
  ///{@macro _InfoAmenitiesPopular}
  const _InfoAmenitiesWidget({
    required this.label,
    required this.isFree,
  });

  final String label;
  final bool isFree;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
          ),
          if (isFree) ...[
            const Gap(10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(2),
              ),
              child: Text(
                'free',
                style: textStyle12w400.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
