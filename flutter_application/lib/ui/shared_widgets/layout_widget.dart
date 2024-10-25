import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LayoutWidget extends ConsumerWidget {
  final Widget child;
  final String title;
  final BuildContext context;

  const LayoutWidget({super.key, required this.context, required this.child, required this.title});

  void onBack() {
    context.pop();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[700],
        title: Text(title),
        leading: context.canPop() ? IconButton(onPressed: onBack, icon: const Icon(CupertinoIcons.chevron_back)) : null,
        foregroundColor: Colors.white,
      ),
      backgroundColor: const Color(0xFF494949),
      body: SafeArea(
        child: child,
      ),
    );
  }
}
