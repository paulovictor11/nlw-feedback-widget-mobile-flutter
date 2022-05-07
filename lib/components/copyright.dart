import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_flutter/theme/colors.dart';

class Copyright extends StatelessWidget {
  const Copyright({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Feito com ♥ pela Rocketseat',
      textAlign: TextAlign.center,
      style: GoogleFonts.inter(
        color: DarkTheme.textSecondary,
        fontWeight: FontWeight.w500,
        fontSize: 12,
      ),
    );
  }
}
