import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:mobile_flutter/theme/colors.dart';

class Screenshot extends StatelessWidget {
  const Screenshot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          DarkTheme.surfaceSecondary,
        ),
        minimumSize: MaterialStateProperty.all<Size>(
          const Size(40, 40),
        ),
      ),
      child: const Icon(
        PhosphorIcons.camera,
        color: DarkTheme.textSecondary,
      ),
    );
  }
}
