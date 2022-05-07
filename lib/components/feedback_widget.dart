import 'package:flutter/material.dart';
import 'package:mobile_flutter/components/feedbacks/feedback_type.dart';
import 'package:mobile_flutter/theme/colors.dart';

class FeedbackWidget extends StatelessWidget {
  const FeedbackWidget({Key? key}) : super(key: key);

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
              const SizedBox(
                height: 250,
                child: FeedbackType(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
