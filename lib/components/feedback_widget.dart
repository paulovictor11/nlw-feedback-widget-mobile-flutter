// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';

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
  final ScreenshotController screenshotController;

  const FeedbackWidget({
    Key? key,
    required this.screenshotController,
  }) : super(key: key);

  @override
  State<FeedbackWidget> createState() => _FeedbackWidgetState();
}

class _FeedbackWidgetState extends State<FeedbackWidget> {
  final _commentController = TextEditingController();

  String _feedbackTypeSelected = '';
  bool _isFeedbackSent = false;
  String _screenshot = '';

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
    if (_feedbackTypeSelected.isNotEmpty && !_isFeedbackSent) {
      return FeedbackContent(
        screenshot: _screenshot,
        feedbakType: feedbackTypes[_feedbackTypeSelected]!,
        commentController: _commentController,
        onRestartFeedback: () {
          setState(() {
            _feedbackTypeSelected = '';
          });
        },
        onSendFeedback: () {
          setState(() {
            _isFeedbackSent = true;
          });
        },
        onTakeScreenshot: () async {
          final image = await widget.screenshotController.capture();
          final imageBase64 = base64.encode(image!.toList());

          setState(() {
            _screenshot = 'data:image/png;base64,$imageBase64';
          });
        },
        onRemoveScreenshot: () {
          setState(() {
            _screenshot = '';
          });
        },
      );
    }

    if (_feedbackTypeSelected.isNotEmpty && _isFeedbackSent) {
      return FeedbackSuccess(
        onRestartFeedback: () {
          setState(() {
            _commentController.text = '';
            _feedbackTypeSelected = '';
            _isFeedbackSent = false;
          });
        },
      );
    }

    return FeedbackType(onSelectOption: (type) {
      setState(() {
        _feedbackTypeSelected = type;
      });
    });
  }
}
