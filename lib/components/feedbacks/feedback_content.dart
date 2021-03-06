// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:mobile_flutter/components/buttons/button.dart';
import 'package:mobile_flutter/components/buttons/screenshot.dart';
import 'package:mobile_flutter/components/copyright.dart';
import 'package:mobile_flutter/components/inputs/textarea.dart';
import 'package:mobile_flutter/theme/colors.dart';

class FeedbackContent extends StatelessWidget {
  final Map<String, Object> feedbakType;
  final TextEditingController commentController;
  final String screenshot;
  final bool isSendingFeedback;
  final VoidCallback onRestartFeedback;
  final VoidCallback onSendFeedback;
  final VoidCallback onTakeScreenshot;
  final VoidCallback onRemoveScreenshot;

  const FeedbackContent({
    Key? key,
    required this.feedbakType,
    required this.commentController,
    required this.screenshot,
    required this.isSendingFeedback,
    required this.onRestartFeedback,
    required this.onSendFeedback,
    required this.onTakeScreenshot,
    required this.onRemoveScreenshot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [
          Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  feedbakType['image'] as Widget,
                  const SizedBox(width: 8),
                  Text(
                    feedbakType['title'].toString(),
                    style: GoogleFonts.inter(
                      color: DarkTheme.textPrimary,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
              GestureDetector(
                onTap: onRestartFeedback,
                child: const Icon(
                  PhosphorIcons.arrow_left,
                  color: DarkTheme.textSecondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Textarea(
            controller: commentController,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ScreenshotButton(
                screenshot: screenshot,
                onPressed: onTakeScreenshot,
                onRemove: onRemoveScreenshot,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Button(
                  label: 'Enviar feedback',
                  backgroundColor: BrandColors.brand,
                  isLoading: isSendingFeedback,
                  onPressed:
                      commentController.text.isEmpty ? () {} : onSendFeedback,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Copyright(),
        ],
      ),
    );
  }
}
