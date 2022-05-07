// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

import 'package:mobile_flutter/theme/colors.dart';

class ScreenshotButton extends StatefulWidget {
  final String screenshot;
  final VoidCallback onPressed;
  final VoidCallback onRemove;

  const ScreenshotButton({
    Key? key,
    required this.screenshot,
    required this.onPressed,
    required this.onRemove,
  }) : super(key: key);

  @override
  State<ScreenshotButton> createState() => _ScreenshotButtonState();
}

class _ScreenshotButtonState extends State<ScreenshotButton> {
  @override
  Widget build(BuildContext context) {
    if (widget.screenshot.isNotEmpty) {
      return GestureDetector(
        onTap: widget.onRemove,
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: DarkTheme.surfaceSecondary,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Stack(
            children: [
              Image.memory(
                base64.decode(widget.screenshot.split(',')[1]),
                fit: BoxFit.fill,
                height: 40,
                width: 40,
              ),
              const Positioned(
                bottom: 0,
                right: 0,
                child: Icon(
                  PhosphorIcons.trash_fill,
                  color: DarkTheme.textSecondary,
                  size: 16,
                ),
              )
            ],
          ),
        ),
      );
    }

    return TextButton(
      onPressed: widget.onPressed,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        backgroundColor: DarkTheme.surfaceSecondary,
        minimumSize: const Size(40, 40),
        padding: const EdgeInsets.all(0),
      ),
      child: const Icon(
        PhosphorIcons.camera,
        color: DarkTheme.textSecondary,
      ),
    );
  }
}
