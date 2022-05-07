// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:mobile_flutter/components/buttons/button.dart';
import 'package:mobile_flutter/components/copyright.dart';
import 'package:mobile_flutter/components/illustration.dart';
import 'package:mobile_flutter/theme/colors.dart';

class FeedbackSuccess extends StatelessWidget {
  final VoidCallback onRestartFeedback;

  const FeedbackSuccess({
    Key? key,
    required this.onRestartFeedback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [
          const SizedBox(height: 34),
          Illustration.success(),
          const SizedBox(height: 8),
          Text(
            'Agradecemos o feedback!',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              color: DarkTheme.textPrimary,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 24),
          Button(
            label: 'Quero enviar outro',
            backgroundColor: DarkTheme.surfaceSecondary,
            onPressed: onRestartFeedback,
          ),
          const SizedBox(height: 56),
          const Copyright(),
        ],
      ),
    );
  }
}
