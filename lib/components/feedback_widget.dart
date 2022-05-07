// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dio/dio.dart';
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
  final _dio = Dio(BaseOptions(baseUrl: 'http://192.168.0.9:3333'));

  String _feedbackTypeSelected = '';
  bool _isFeedbackSent = false;
  String _screenshot = '';
  bool _isSendingFeedback = false;

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
        feedbakType: feedbackTypes[_feedbackTypeSelected]!,
        commentController: _commentController,
        screenshot: _screenshot,
        isSendingFeedback: _isSendingFeedback,
        onRestartFeedback: _resetFields,
        onSendFeedback: _onSendFeedback,
        onTakeScreenshot: _onTakeScreenshot,
        onRemoveScreenshot: () {
          setState(() {
            _screenshot = '';
          });
        },
      );
    }

    if (_feedbackTypeSelected.isNotEmpty && _isFeedbackSent) {
      return FeedbackSuccess(
        onRestartFeedback: _resetFields,
      );
    }

    return FeedbackType(onSelectOption: (type) {
      setState(() {
        _feedbackTypeSelected = type;
      });
    });
  }

  void _onSendFeedback() async {
    setState(() {
      _isSendingFeedback = true;
    });

    await _dio.post('/feedbacks', data: {
      'type': _feedbackTypeSelected,
      'comment': _commentController.text,
      'screenchot': 'data:image/png;base64,$_screenshot'
    });

    setState(() {
      _isSendingFeedback = false;
      _isFeedbackSent = true;
    });
  }

  void _onTakeScreenshot() async {
    final image = await widget.screenshotController.capture();
    final imageBase64 = base64.encode(image!.toList());

    setState(() {
      _screenshot = imageBase64;
    });
  }

  void _resetFields() {
    setState(() {
      _commentController.text = '';
      _feedbackTypeSelected = '';
      _isFeedbackSent = false;
    });
  }
}
