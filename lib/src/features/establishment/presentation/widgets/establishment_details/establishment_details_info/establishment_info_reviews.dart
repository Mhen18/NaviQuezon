import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/core/blocs/app_role_cubit.dart';
import 'package:naviquezon/src/core/themes/assets.gen.dart';
import 'package:naviquezon/src/core/themes/styles/color_style.dart';
import 'package:naviquezon/src/core/themes/styles/text_style_default.dart';
import 'package:naviquezon/src/core/utils/constants/enums/app_role_enums.dart';
import 'package:naviquezon/src/core/utils/extensions/datetime_extensions.dart';
import 'package:naviquezon/src/core/utils/extensions/num_extensions.dart';
import 'package:naviquezon/src/core/utils/loggers/print_logger.dart';
import 'package:naviquezon/src/core/widgets/buttons/rounded_button.dart';
import 'package:naviquezon/src/core/widgets/dialogs/loading_dialog.dart';
import 'package:naviquezon/src/core/widgets/snack_bars/app_snack_bar.dart';
import 'package:naviquezon/src/core/widgets/text_fields/rounded_text_field.dart';
import 'package:naviquezon/src/features/establishment/application/blocs/establishment_review_add_cubit.dart';
import 'package:naviquezon/src/features/establishment/application/blocs/establishment_review_get_cubit.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_review_add_model.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_review_model.dart';

///{@template EstablishmentInfoReviews}
/// Custom widget that display the establishment reviews
///{@endtemplate}
class EstablishmentInfoReviews extends StatefulWidget {
  ///{@macro EstablishmentInfoReviews}
  const EstablishmentInfoReviews({
    required String establishmentId,
    super.key,
  }) : _establishmentId = establishmentId;

  final String _establishmentId;

  @override
  State<EstablishmentInfoReviews> createState() =>
      _EstablishmentInfoReviewsState();
}

class _EstablishmentInfoReviewsState extends State<EstablishmentInfoReviews> {
  final _reviewCubit = EstablishmentReviewGetCubit();
  final _reviewAddCubit = EstablishmentReviewAddCubit();

  /// Getter for the role
  ///
  AppRoleEnum get _role {
    //  Get the role state from the app role cubit.
    final roleState = BlocProvider.of<AppRoleCubit>(context).state;

    return roleState;
  }

  @override
  void initState() {
    super.initState();

    _initBlocs();
  }

  /// Method to initialize the blocs/cubits.
  ///
  void _initBlocs() {
    _reviewCubit.run(widget._establishmentId);
  }

  /// Method to handle the add review button
  ///
  void _onAddReviewPressed() {
    _ReviewAddBottomSheet.show(
      context,
      _onSavePressed,
    );
  }

  /// Method to handle the save review
  ///
  void _onSavePressed(String? comment, int rate) {
    //  Create the establishment review model
    final establishmentReview = EstablishmentReviewAddModel(
      rate: rate + 1,
      comment: comment,
    );

    //  Call the add review cubit
    _reviewAddCubit.run(
      establishmentId: widget._establishmentId,
      review: establishmentReview,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => _reviewCubit,
        ),
        BlocProvider(
          create: (context) => _reviewAddCubit,
        ),
      ],
      child: BlocListener<EstablishmentReviewAddCubit, CubitState>(
        listener: (context, addState) {
          if (addState is CubitStateLoading) {
            //  Show loading dialog
            LoadingDialog.show(context);
          }

          if (addState is CubitStateFailed) {
            //  Hide loading dialog
            LoadingDialog.hide(context);

            //  Get the failures
            final failure = addState.failure;
            //  Show the error message
            AppSnackBar.error(context).show(failure.message);
          }

          if (addState is CubitStateSuccess) {
            //  Hide loading dialog
            LoadingDialog.hide(context);

            //  Show the error message
            AppSnackBar.success(context).show(
              'Review added successfully',
            );

            _reviewCubit.run(widget._establishmentId);
          }
        },
        child: BlocBuilder<EstablishmentReviewGetCubit, CubitState>(
          builder: (context, reviewState) {
            if (reviewState is CubitStateLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (reviewState is CubitStateFailed) {
              final failure = reviewState.failure;

              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(failure.message),
                    const Gap(16),
                    RoundedButton(
                      onPressed: () => _reviewCubit.run(
                        widget._establishmentId,
                      ),
                      label: 'Retry',
                    ),
                  ],
                ),
              );
            }

            if (reviewState is CubitStateSuccess) {
              //  Get the reviews from the state.
              final value = reviewState.value;
              //  Cast the value to a list of establishment review model.
              final reviewList = value as List<EstablishmentReviewModel>;

              return Column(
                children: [
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        //  Check if the review list is empty.
                        if (reviewList.isEmpty) {
                          //  If empty, display a message.
                          return const Center(
                            child: Text(
                              'No reviews available',
                            ),
                          );
                        }

                        return SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: _ReviewAverageWidget(
                                        reviewList: reviewList,
                                      ),
                                    ),
                                    const VerticalDivider(),
                                    Expanded(
                                      flex: 3,
                                      child: _ReviewRatingList(
                                        reviewList: reviewList,
                                      ),
                                    ),
                                  ],
                                ),
                                const Gap(16),
                                _ReviewCommentList(
                                  reviewList: reviewList,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  if (_role == AppRoleEnum.user) ...[
                    const Gap(16),
                    RoundedButton(
                      onPressed: _onAddReviewPressed,
                      label: 'Write a Review',
                      width: double.infinity,
                    ),
                  ],
                ],
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}

///{@template _ReviewAverageWidget}
/// Custom widget that display the review average
///{@endtemplate}
class _ReviewAverageWidget extends StatelessWidget {
  ///{@macro _ReviewAverageWidget}
  const _ReviewAverageWidget({
    required List<EstablishmentReviewModel> reviewList,
  }) : _reviewList = reviewList;

  final List<EstablishmentReviewModel> _reviewList;

  num get _ratingAverage {
    final total = _reviewList.fold<num>(0, (previousValue, element) {
      return previousValue + element.rate;
    });

    return total / _reviewList.length;
  }

  String get _reviewTotal {
    final total = _reviewList.length;
    if (total > 1) {
      return '$total Reviews';
    } else {
      return '$total Review';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          _ratingAverage.toStringAsFixed(1),
          style: textStyle24w600,
        ),
        Text(
          _reviewTotal,
          style: textStyle10w400,
        ),
      ],
    );
  }
}

///{@template _ReviewRatingList}
/// Custom widget that display the review rating list
///{@endtemplate}
class _ReviewRatingList extends StatelessWidget {
  ///{@macro _ReviewRatingList}
  const _ReviewRatingList({
    required List<EstablishmentReviewModel> reviewList,
  }) : _reviewList = reviewList;

  final List<EstablishmentReviewModel> _reviewList;

  /// Method to get the rating
  double _getRating(int rate) {
    //  Get the total rating
    final rating = _reviewList.where((element) => element.rate == rate).length;

    //  Get the rating average
    return rating / _reviewList.length;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ReviewStarProgress(
          star: 5,
          progress: _getRating(5),
        ),
        _ReviewStarProgress(
          star: 4,
          progress: _getRating(4),
        ),
        _ReviewStarProgress(
          star: 3,
          progress: _getRating(3),
        ),
        _ReviewStarProgress(
          star: 2,
          progress: _getRating(2),
        ),
        _ReviewStarProgress(
          star: 1,
          progress: _getRating(1),
        ),
      ],
    );
  }
}

///{@template _ReviewStarProgress}
/// Custom widget that display the review star progress
///{@endtemplate}
class _ReviewStarProgress extends StatelessWidget {
  ///{@macro _ReviewStarProgress}
  const _ReviewStarProgress({
    required this.star,
    required this.progress,
  });

  final int star;
  final double progress;

  /// Get the star text
  ///
  String get _star {
    if (star > 1) {
      return '$star stars';
    }

    return '$star star';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            _star,
            textAlign: TextAlign.end,
          ),
        ),
        const Gap(8),
        Expanded(
          flex: 3,
          child: SizedBox(
            height: 12,
            child: LinearProgressIndicator(
              borderRadius: BorderRadius.circular(8),
              value: progress,
            ),
          ),
        ),
      ],
    );
  }
}

///{@template _ReviewCommentList}
/// Custom widget that display the review comment list
///{@endtemplate}
class _ReviewCommentList extends StatelessWidget {
  ///{@macro _ReviewCommentList}
  const _ReviewCommentList({
    required List<EstablishmentReviewModel> reviewList,
  }) : _reviewList = reviewList;

  final List<EstablishmentReviewModel> _reviewList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        final review = _reviewList[index];

        return _ReviewCommentWidget(
          review: review,
        );
      },
      separatorBuilder: (context, index) {
        return const Gap(12);
      },
      itemCount: _reviewList.length,
    );
  }
}

///{@template _ReviewCommentWidget}
/// Custom widget that display the review comment
///{@endtemplate}
class _ReviewCommentWidget extends StatelessWidget {
  ///{@macro _ReviewCommentWidget}
  const _ReviewCommentWidget({
    required EstablishmentReviewModel review,
  }) : _review = review;

  final EstablishmentReviewModel _review;

  /// Getter for the converted date
  ///
  String get _date {
    final convertedDate = _review.updatedDate.toUnixTime();
    final formattedDate = convertedDate.formatDate(
      format: 'MMMM dd, yyyy hh:mm a',
    );

    printInfo(convertedDate);
    printInfo(formattedDate);

    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _review.userName ?? 'N/A',
                  style: textStyle12w600,
                ),
                Text(
                  _date,
                  style: textStyle10w400.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
                if (_review.comment != null) ...[
                  const Gap(8),
                  Text(
                    _review.comment!,
                    style: textStyle14w400,
                  ),
                ],
              ],
            ),
          ),
          Row(
            children: [
              Text(
                _review.rate.toString(),
              ),
              const Gap(4),
              Assets.images.icons.amenities.icRate.image(
                height: 20,
                width: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

///{@template _ReviewAddBottomSheet}
/// Custom bottom sheet for adding a review
///{@endtemplate}
class _ReviewAddBottomSheet extends StatefulWidget {
  ///{@macro _ReviewAddBottomSheet}
  const _ReviewAddBottomSheet({
    required void Function(String?, int) onSave,
  }) : _onSave = onSave;

  final void Function(String?, int) _onSave;

  /// Show the bottom sheet
  ///
  static void show(
    BuildContext context,
    void Function(String?, int) onSave,
  ) {
    showModalBottomSheet<_ReviewAddBottomSheet>(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return _ReviewAddBottomSheet(
          onSave: onSave,
        );
      },
    );
  }

  @override
  State<_ReviewAddBottomSheet> createState() => _ReviewAddBottomSheetState();
}

class _ReviewAddBottomSheetState extends State<_ReviewAddBottomSheet> {
  final _controller = TextEditingController();

  int _rate = -1;

  bool get _valid {
    return _rate >= 0;
  }

  /// Method to handle the star pressed
  ///
  void _onStarPressed(int rate) {
    setState(() {
      _rate = rate;
    });
  }

  /// Method to handle the review changed
  void _onReviewChanged(String? value) {
    setState(() {});

    printInfo(_rate);
  }

  /// Method to handle the save pressed
  void _onSavePressed() {
    if (_valid) {
      //  Get the comment
      final comment = _controller.text.isNotEmpty ? _controller.text : null;

      //  Call the onSave function
      widget._onSave(comment, _rate);

      //  Close the bottom sheet
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Gap(16),
            Text(
              'Rate and Add Review',
              style: textStyle16w600,
            ),
            const Gap(16),
            _ReviewStar(
              onStarPressed: _onStarPressed,
              rate: _rate,
            ),
            const Gap(16),
            RoundedTextField(
              controller: _controller,
              onChanged: _onReviewChanged,
              maxLines: 4,
              hint: 'Comment',
            ),
            const Gap(16),
            RoundedButton(
              label: 'Save',
              width: double.infinity,
              onPressed: _valid ? _onSavePressed : null,
            ),
          ],
        ),
      ),
    );
  }
}

///{@template _ReviewStar}
/// Custom widget that display the review star
///{@endtemplate}
class _ReviewStar extends StatelessWidget {
  ///{@macro _ReviewStar}
  const _ReviewStar({
    required void Function(int) onStarPressed,
    required int rate,
  })  : _onStarPressed = onStarPressed,
        _rate = rate;

  final void Function(int)? _onStarPressed;
  final int _rate;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: List.generate(5, (index) {
        return InkWell(
          customBorder: const CircleBorder(),
          onTap: _onStarPressed != null ? () => _onStarPressed(index) : null,
          child: Icon(
            _rate >= index ? Icons.star : Icons.star_border_outlined,
            color: color1363DF,
            size: 24,
          ),
        );
      }),
    );
  }
}
