// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:mobile_flutter/theme/colors.dart';

class Button extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final bool isLoading;
  final VoidCallback onPressed;

  const Button({
    Key? key,
    required this.label,
    required this.backgroundColor,
    this.isLoading = false,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        backgroundColor: backgroundColor,
        fixedSize: const Size.fromHeight(40),
        padding: EdgeInsets.zero,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: _renderLabel(),
      ),
    );
  }

  Widget _renderLabel() {
    if (isLoading) {
      return const SizedBox(
        height: 15,
        width: 15,
        child: CircularProgressIndicator(
          color: DarkTheme.textPrimary,
          strokeWidth: 2,
        ),
      );
    }

    return Text(
      label,
      style: GoogleFonts.inter(
        color: BrandColors.textOnBrandColor,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
    );
  }
}
