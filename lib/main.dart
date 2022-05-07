import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:mobile_flutter/components/feedback_widget.dart';
import 'package:mobile_flutter/theme/colors.dart';

void main() {
  runApp(const MaterialApp(
    title: 'FeedGet',
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColors.background,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openFeedbackBottomSheet(context),
        backgroundColor: BrandColors.brand,
        child: const Icon(
          PhosphorIcons.chat_teardrop_dots,
          color: BrandColors.textOnBrandColor,
          size: 28,
        ),
      ),
    );
  }

  void _openFeedbackBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: DarkTheme.surfacePrimary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      builder: (context) {
        return const FeedbackWidget();
      },
    );
  }
}
