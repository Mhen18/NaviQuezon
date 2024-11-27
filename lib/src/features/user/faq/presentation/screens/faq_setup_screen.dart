import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/core/themes/styles/text_style_default.dart';
import 'package:naviquezon/src/core/utils/keys/route_keys.dart';
import 'package:naviquezon/src/core/widgets/buttons/rounded_button.dart';
import 'package:naviquezon/src/core/widgets/dialogs/loading_dialog.dart';
import 'package:naviquezon/src/core/widgets/snack_bars/app_snack_bar.dart';
import 'package:naviquezon/src/core/widgets/text_fields/rounded_text_field.dart';
import 'package:naviquezon/src/features/user/faq/application/blocs/faq_delete_cubit.dart';
import 'package:naviquezon/src/features/user/faq/application/blocs/faq_get_cubit.dart';
import 'package:naviquezon/src/features/user/faq/application/blocs/faq_setup_cubit.dart';
import 'package:naviquezon/src/features/user/faq/domain/models/faq_add_model.dart';
import 'package:naviquezon/src/features/user/faq/domain/models/faq_model.dart';

///{@template FaqSetupScreen}
/// Screen to setup the FAQ.
///{@endtemplate}
class FaqSetupScreen extends StatefulWidget {
  ///{@macro FaqSetupScreen}
  const FaqSetupScreen({super.key});

  static const route = rFaqSetup;

  @override
  State<FaqSetupScreen> createState() => _FaqSetupScreenState();
}

class _FaqSetupScreenState extends State<FaqSetupScreen> {
  final _faqCubit = FaqGetCubit();
  final _faqSetupCubit = FaqSetupCubit();
  final _faqDeleteCubit = FaqDeleteCubit();

  @override
  void initState() {
    super.initState();

    _initBlocs();
  }

  /// Method to initialize the blocs/cubits.
  ///
  void _initBlocs() {
    _faqCubit.run();
  }

  /// Method to handle the save pressed.
  ///
  void _onSavePressed(
    String? faqId,
    String question,
    String answer,
  ) {
    //  Create the faq model
    final faq = FaqAddModel(question: question, answer: answer);

    //  Run the faq setup cubit
    _faqSetupCubit.run(faq, faqId: faqId);
  }

  /// Method to handle the add/edit faq pressed.
  ///
  void _onAddEditFaqPressed({FaqModel? faq}) {
    //  Show the bottom sheet for adding/editing the faq
    showModalBottomSheet<_SetupBottomSheet>(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return _SetupBottomSheet(
          onSavePressed: _onSavePressed,
          faq: faq,
        );
      },
    );
  }

  /// Method to handle the delete pressed.
  ///
  void _onDeleteFaqPressed(String faqId) {
    //  Run the faq delete cubit
    _faqDeleteCubit.run(faqId);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => _faqCubit,
        ),
        BlocProvider(
          create: (context) => _faqSetupCubit,
        ),
        BlocProvider(
          create: (context) => _faqDeleteCubit,
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('FAQ Setup'),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: _onAddEditFaqPressed,
            ),
          ],
        ),
        body: MultiBlocListener(
          listeners: [
            BlocListener<FaqSetupCubit, CubitState>(
              listener: (context, setupState) {
                if (setupState is CubitStateLoading) {
                  //  Show the loading dialog.
                  LoadingDialog.show(context);
                }

                if (setupState is CubitStateFailed) {
                  //  Close the dialog.
                  LoadingDialog.hide(context);

                  final failure = setupState.failure;

                  //  Show the error message.
                  AppSnackBar.error(context).show(failure.message);
                }

                if (setupState is CubitStateSuccess<bool>) {
                  //  Close the dialog.
                  LoadingDialog.hide(context);

                  //  Check if the faq setup is from edit.
                  final isEdit = setupState.value;

                  if (isEdit) {
                    //  Show the success message.
                    AppSnackBar.success(context).show(
                      'FAQ updated successfully.',
                    );
                  } else {
                    //  Show the success message.
                    AppSnackBar.success(context).show(
                      'FAQ added successfully.',
                    );
                  }

                  //  Run the faq cubit
                  _faqCubit.run();
                }
              },
            ),
            BlocListener<FaqDeleteCubit, CubitState>(
              listener: (context, deleteState) {
                if (deleteState is CubitStateLoading) {
                  //  Show the loading dialog.
                  LoadingDialog.show(context);
                }

                if (deleteState is CubitStateFailed) {
                  //  Close the dialog.
                  LoadingDialog.hide(context);

                  final failure = deleteState.failure;

                  //  Show the error message.
                  AppSnackBar.error(context).show(failure.message);

                  _faqCubit.run();
                }

                if (deleteState is CubitStateSuccess) {
                  //  Close the dialog.
                  LoadingDialog.hide(context);

                  //  Show the success message.
                  AppSnackBar.success(context).show(
                    'FAQ deleted successfully.',
                  );

                  //  Run the faq cubit
                  _faqCubit.run();
                }
              },
            ),
          ],
          child: BlocBuilder<FaqGetCubit, CubitState>(
            builder: (context, faqState) {
              if (faqState is CubitStateLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (faqState is CubitStateFailed) {
                final failure = faqState.failure;

                return Center(
                  child: Text(failure.message),
                );
              }

              if (faqState is CubitStateSuccess<List<FaqModel>>) {
                final faqList = faqState.value;

                if(faqList.isEmpty) {
                  return const Center(
                    child: Text('No FAQ found.'),
                  );
                }

                return ListView.separated(
                  itemCount: faqList.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    final faq = faqList[index];

                    return ListTile(
                      title: Text(faq.question),
                      subtitle: Text(faq.answer),
                      trailing: Wrap(
                        children: <Widget>[
                          IconButton(
                            onPressed: () => _onAddEditFaqPressed(faq: faq),
                            icon: const Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () => _onDeleteFaqPressed(faq.id),
                            icon: const Icon(Icons.delete),
                          ),
                        ],
                      ),
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

///{@template _SetupBottomSheet}
/// Custom widget to display the field for adding or editing the FAQ.
///{@endtemplate}
class _SetupBottomSheet extends StatefulWidget {
  ///{@macro _SetupBottomSheet}
  const _SetupBottomSheet({
    required void Function(String?, String, String) onSavePressed,
    FaqModel? faq,
  })  : _onSavePressed = onSavePressed,
        _faq = faq;

  final FaqModel? _faq;
  final void Function(String?, String, String) _onSavePressed;

  @override
  State<_SetupBottomSheet> createState() => _SetupBottomSheetState();
}

class _SetupBottomSheetState extends State<_SetupBottomSheet> {
  final _questionController = TextEditingController();
  final _answerController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (_faq != null) {
      _questionController.text = _faq?.question ?? '';
      _answerController.text = _faq?.answer ?? '';
    }
  }

  /// Getter for the faq model.
  ///
  FaqModel? get _faq => widget._faq;

  /// Getter for the title.
  ///
  String get _title => _faq == null ? 'Add FAQ' : 'Edit FAQ';

  /// Getter for the validation to enable or disable the save button.
  ///
  bool get _valid {
    final question = _questionController.text;
    final answer = _answerController.text;

    if (_faq != null) {
      final newQuestion = _faq?.question != question;
      final newAnswer = _faq?.answer != answer;

      //  Check if the question or answer is not same as the faq.
      return newQuestion || newAnswer;
    }

    //  Check if the question and answer are not empty.
    return question.isNotEmpty && answer.isNotEmpty;
  }

  /// Method to handle the save pressed.
  ///
  void _onSavePressed() {
    final faqId = _faq?.id;
    final question = _questionController.text;
    final answer = _answerController.text;

    //  Save the faq
    widget._onSavePressed(faqId, question, answer);

    Navigator.pop(context);
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
            Text(
              _title,
              style: textStyle16w600,
            ),
            const Gap(16),
            RoundedTextField(
              controller: _questionController,
              onChanged: (_) => setState(() {}),
              label: 'Question',
              hint: 'Question',
            ),
            const Gap(8),
            RoundedTextField(
              controller: _answerController,
              onChanged: (_) => setState(() {}),
              label: 'Answer',
              hint: 'Answer',
            ),
            const Gap(12),
            RoundedButton(
              onPressed: _valid ? _onSavePressed : null,
              label: 'Save',
            ),
          ],
        ),
      ),
    );
  }
}
