import 'package:flutter/material.dart';
import 'package:mobile_flutter/components/feedbacks/feedback_content.dart';
import 'package:mobile_flutter/components/feedbacks/feedback_success.dart';
import 'package:mobile_flutter/components/feedbacks/feedback_type.dart';
import 'package:mobile_flutter/components/illustration.dart';
import 'package:mobile_flutter/theme/colors.dart';

final feedbackTypes = {
  'BUG': {
    'title': 'Problema',
    'image': Illustration.bug(
      size: const Size(24, 24),
    ),
  },
  'IDEA': {
    'title': 'Ideia',
    'image': Illustration.idea(
      size: const Size(24, 24),
    ),
  },
  'OTHER': {
    'title': 'Outro',
    'image': Illustration.thought(
      size: const Size(24, 24),
    ),
  },
};

class FeedbackWidget extends StatefulWidget {
  const FeedbackWidget({Key? key}) : super(key: key);

  @override
  State<FeedbackWidget> createState() => _FeedbackWidgetState();
}

class _FeedbackWidgetState extends State<FeedbackWidget> {
  final _commentController = TextEditingController();

  String feedbackTypeSelected = '';
  bool isFeedbackSent = false;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 16),
          child: Column(
            children: [
              Container(
                height: 4,
                width: 56,
                decoration: BoxDecoration(
                  color: DarkTheme.surfaceSecondaryHover,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 250,
                child: _renderFeedbackStep(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _renderFeedbackStep() {
    if (feedbackTypeSelected.isNotEmpty && !isFeedbackSent) {
      return FeedbackContent(
        feedbakType: feedbackTypes[feedbackTypeSelected]!,
        commentController: _commentController,
        onRestartFeedback: () {
          setState(() {
            feedbackTypeSelected = '';
          });
        },
        onSendFeedback: () {
          setState(() {
            isFeedbackSent = true;
          });
        },
      );
    }

    if (feedbackTypeSelected.isNotEmpty && isFeedbackSent) {
      return FeedbackSuccess(
        onRestartFeedback: () {
          setState(() {
            _commentController.text = '';
            feedbackTypeSelected = '';
            isFeedbackSent = false;
          });
        },
      );
    }

    return FeedbackType(onSelectOption: (type) {
      setState(() {
        feedbackTypeSelected = type;
      });
    });
  }
}
