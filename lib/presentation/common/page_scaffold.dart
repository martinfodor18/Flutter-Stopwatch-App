import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_color.dart';

class PageScaffold extends HookConsumerWidget {
  final Widget body;
  final String appBarTitleKey;
  final FloatingActionButton? floatingActionButton;

  const PageScaffold({
    super.key,
    required this.body,
    required this.appBarTitleKey,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    context.locale; // Trigger rebuild on locale change
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitleKey.tr()),
        backgroundColor: AppColor.brandGreen,
        titleTextStyle: TextStyle(
          color: AppColor.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(padding: const .all(8.0), child: body),
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
