import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_flutter/components/copyright.dart';
import 'package:mobile_flutter/components/illustration.dart';
import 'package:mobile_flutter/components/buttons/option.dart';
import 'package:mobile_flutter/theme/colors.dart';

class FeedbackType extends StatelessWidget {
  const FeedbackType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [
          Text(
            'Deixe seu feedback',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              color: DarkTheme.textPrimary,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Option(
                  image: Illustration.bug(),
                  title: 'Problema',
                ),
                Option(
                  image: Illustration.idea(),
                  title: 'Ideia',
                ),
                Option(
                  image: Illustration.thought(),
                  title: 'Outro',
                ),
              ],
            ),
          ),
          const Copyright(),
        ],
      ),
    );
  }
}
