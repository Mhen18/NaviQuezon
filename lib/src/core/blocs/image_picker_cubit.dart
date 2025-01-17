import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/core/utils/constants/enums/image_picker_enums.dart';
import 'package:naviquezon/src/core/utils/constants/failures/default_failure.dart';

///{@template ImagePickerCubit}
/// Cubit for the image picker.
///{@endtemplate}
class ImagePickerCubit extends Cubit<CubitState> {
  ///{@macro ImagePickerCubit}
  ImagePickerCubit() : super(CubitStateInitial());

  /// Future method to run and emit state for [ImagePickerCubit].
  Future<void> run(ImagePickerEnums source) async {
    emit(CubitStateLoading());
    try {
      final imagePicker = ImagePicker();

      final image = await imagePicker.pickImage(
        source: source == ImagePickerEnums.camera
            ? ImageSource.camera
            : ImageSource.gallery,
        imageQuality: 80,
      );

      if (image != null) {
        emit(CubitStateSuccess<String>(image.path));
      } else {
        emit(
          CubitStateFailed(const DefaultFailure(message: 'No image picked')),
        );
      }
    } on Exception catch (_) {
      emit(CubitStateFailed(const DefaultFailure()));
    }
  }
}
