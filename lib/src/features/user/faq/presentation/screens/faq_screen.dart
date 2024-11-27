import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/core/themes/assets.gen.dart';
import 'package:naviquezon/src/core/themes/styles/color_style.dart';
import 'package:naviquezon/src/core/themes/styles/text_style_default.dart';
import 'package:naviquezon/src/core/utils/keys/route_keys.dart';
import 'package:naviquezon/src/core/widgets/buttons/rounded_button.dart';
import 'package:naviquezon/src/features/user/faq/application/blocs/faq_get_cubit.dart';
import 'package:naviquezon/src/features/user/faq/domain/enums/chat_type_enum.dart';
import 'package:naviquezon/src/features/user/faq/domain/models/faq_model.dart';

///{@template FaqScreen}
/// Screen that display the FAQ of the app.
///{@endtemplate}
class FaqScreen extends StatefulWidget {
  ///{@macro FaqScreen}
  const FaqScreen({super.key});

  static const route = rFaq;

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  final _faqCubit = FaqGetCubit();

  final _chatList = <(String, ChatTypeEnum)>[];

  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _initBlocs();
  }

  /// Method to initialize the blocs/cubits.
  void _initBlocs() {
    //  Run the faq cubit
    _faqCubit.run();
  }

  /// Method to handle the question pressed.
  void _onQuestionPressed(FaqModel faq) {
    final chatQuestion = (faq.question, ChatTypeEnum.question);
    final chatAnswer = (faq.answer, ChatTypeEnum.answer);

    //  Add the chat to the chat list
    setState(() {
      _chatList
        ..add(chatQuestion)
        ..add(chatAnswer);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _faqCubit,
      child: Scaffold(
        backgroundColor: colorF1FBFF,
        body: SafeArea(
          child: BlocBuilder<FaqGetCubit, CubitState>(
            builder: (context, faqState) {
              if (faqState is CubitStateLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (faqState is CubitStateFailed) {
                return _FaqEmptyList(
                  onPressed: _faqCubit.run,
                );
              }

              if (faqState is CubitStateSuccess<List<FaqModel>>) {
                final faqList = faqState.value;

                //  Check if the faq list is empty
                if (faqList.isEmpty) {
                  return _FaqEmptyList(
                    onPressed: _faqCubit.run,
                  );
                }

                return Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(),
                  ),
                  child: Column(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            padding: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: colorD9D9D9,
                            ),
                            child: Assets.images.logo.logoPidol.image(
                              height: 50,
                              width: 50,
                            ),
                          ),
                          const Gap(4),
                          Text(
                            'Pidol',
                            style: textStyle12w600,
                          ),
                          const Gap(8),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Divider(color: Colors.black87),
                          ),
                        ],
                      ),
                      const Gap(8),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            children: [
                              Expanded(
                                child: Scrollbar(
                                  controller: _scrollController,
                                  thumbVisibility: true,
                                  child: ListView.separated(
                                    controller: _scrollController,
                                    shrinkWrap: true,
                                    itemCount: _chatList.length,
                                    itemBuilder: (context, index) {
                                      final chat = _chatList[index];

                                      return _FaqChatBubble(
                                        chat: chat,
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return const Gap(4);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Gap(8),
                      _FaqQuestionWidget(
                        onQuestionPressed: _onQuestionPressed,
                        faqList: faqList,
                      ),
                    ],
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

///{@template _FaqChatBubble}
/// Widget to display the faq chat bubble.
///{@endtemplate}
class _FaqChatBubble extends StatelessWidget {
  ///{@macro _FaqChatBubble}
  const _FaqChatBubble({
    required this.chat,
  });

  final (String, ChatTypeEnum) chat;

  /// Getter for the chat bubble background color.
  ///
  Color get _chatColor {
    if (chat.$2 == ChatTypeEnum.question) {
      return Colors.black87;
    }

    return const Color(0xFF1B97F3);
  }

  /// Getter to determine if the chat is from the sender.
  ///
  bool get _chatFromSender {
    return chat.$2 == ChatTypeEnum.question;
  }

  @override
  Widget build(BuildContext context) {
    return BubbleSpecialThree(
      text: chat.$1,
      color: _chatColor,
      textStyle: const TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
      isSender: _chatFromSender,
    );
  }
}

///{@template _FaqQuestionWidget}
/// Widget to display the faq question.
///{@endtemplate}
class _FaqQuestionWidget extends StatefulWidget {
  ///{@macro _FaqQuestionWidget}
  const _FaqQuestionWidget({
    required void Function(FaqModel) onQuestionPressed,
    required List<FaqModel> faqList,
  })  : _onQuestionPressed = onQuestionPressed,
        _faqList = faqList;

  final List<FaqModel> _faqList;
  final void Function(FaqModel) _onQuestionPressed;

  @override
  State<_FaqQuestionWidget> createState() => _FaqQuestionWidgetState();
}

class _FaqQuestionWidgetState extends State<_FaqQuestionWidget> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'Hi, I’m Pidol!',
            style: textStyle12w600,
          ),
          Text(
            'You can ask me some questions such as:',
            style: textStyle12w600,
          ),
          const Gap(8),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: Row(
              children: [
                Expanded(
                  child: Scrollbar(
                    controller: _scrollController,
                    thumbVisibility: true,
                    child: ListView.separated(
                      controller: _scrollController,
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(right: 8),
                      itemBuilder: (context, index) {
                        final faq = widget._faqList[index];

                        return RoundedButton(
                          onPressed: () => widget._onQuestionPressed(faq),
                          backgroundColor: Colors.black87,
                          label: widget._faqList[index].question,
                          labelColor: Colors.white,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Gap(4);
                      },
                      itemCount: widget._faqList.length,
                    ),
                  ),
                ),
                const Gap(8),
                Assets.images.logo.logoPidol.image(
                  height: 150,
                ),
              ],
            ),
          ),
          Center(
            child: Assets.images.logo.logoNavi.image(
              height: 20,
            ),
          ),
        ],
      ),
    );
  }
}

///{@template _FaqEmptyList}
/// Widget to display when the faq list is empty.
///{@endtemplate}
class _FaqEmptyList extends StatelessWidget {
  const _FaqEmptyList({
    required this.onPressed,
  });

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Failed to load FAQ',
            style: textStyle12w600,
          ),
          const Gap(8),
          RoundedButton(
            onPressed: onPressed,
            label: 'Retry',
            labelColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
