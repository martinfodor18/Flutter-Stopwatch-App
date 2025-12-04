import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../theme/app_color.dart';
import '../theme/app_spacing.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text("Stopwatch"),
        backgroundColor: AppColor.brandGreen,
        titleTextStyle: Theme.of(context).textTheme.titleLarge
      ),
      body: Padding(padding: const .all(AppSpacing.extraSmall), child: body),
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
