import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_flutter/components/buttons/button.dart';
import 'package:mobile_flutter/components/copyright.dart';
import 'package:mobile_flutter/components/illustration.dart';
import 'package:mobile_flutter/components/buttons/screenshot.dart';
import 'package:mobile_flutter/components/inputs/textarea.dart';
import 'package:mobile_flutter/theme/colors.dart';

class FeedbackContent extends StatelessWidget {
  const FeedbackContent({Key? key}) : super(key: key);

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
                  Illustration.bug(
                    size: const Size(24, 24),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Problema',
                    style: GoogleFonts.inter(
                      color: DarkTheme.textPrimary,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
              const Icon(
                PhosphorIcons.arrow_left,
                color: DarkTheme.textSecondary,
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Textarea(),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Screenshot(),
              Expanded(
                child: Button(
                  label: 'Enviar feedback',
                  backgroundColor: BrandColors.brand,
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
