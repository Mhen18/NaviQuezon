import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:naviquezon/src/core/themes/styles/text_style_default.dart';

///{@template LikeButton}
/// Custom widget for like button.
///{@endtemplate}
class LikeButton extends StatelessWidget {
  ///{@macro LikeButton}
  const LikeButton({
    required ValueChanged<bool> onLikePressed,
    required bool isLiked,
    super.key,
  })  : _onLikePressed = onLikePressed,
        _isLiked = isLiked,
        _withLabel = false;

  ///{@macro LikeButton}
  const LikeButton.label({
    required ValueChanged<bool> onLikePressed,
    required bool isLiked,
    super.key,
  })  : _onLikePressed = onLikePressed,
        _isLiked = isLiked,
        _withLabel = true;

  final ValueChanged<bool> _onLikePressed;
  final bool _isLiked;
  final bool _withLabel;

  /// Getter for the like text.
  ///
  String get _likeText {
    if (_isLiked) {
      return 'Liked';
    }

    return 'Like';
  }

  /// Getter for the like icon.
  ///
  IconData get _icon {
    //  Check if the establishment is liked
    if (_isLiked) {
      return Icons.favorite;
    }

    return Icons.favorite_border;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _onLikePressed(!_isLiked),
      child: ColoredBox(
        color: Colors.transparent,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.black87,
                shape: BoxShape.circle,
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 2),
                child: Icon(
                  _icon,
                  size: 16,
                  color: Colors.white,
                ),
              ),
            ),
            if (_withLabel) ...[
              const Gap(4),
              Text(
                _likeText,
                style: textStyle12w400,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
