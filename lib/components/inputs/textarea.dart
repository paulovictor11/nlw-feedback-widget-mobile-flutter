// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:mobile_flutter/theme/colors.dart';

class Textarea extends StatelessWidget {
  final TextEditingController controller;

  const Textarea({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      textAlign: TextAlign.start,
      maxLines: 4,
      controller: controller,
      style: GoogleFonts.inter(
        color: DarkTheme.textPrimary,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
      decoration: InputDecoration(
        hintText: 'Conte com detalhes o que está acontecendo...',
        hintStyle: GoogleFonts.inter(
          color: DarkTheme.textSecondary,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(
            width: 1,
            color: DarkTheme.stroke,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(
            width: 1,
            color: BrandColors.brand,
          ),
        ),
      ),
    );
  }
}
