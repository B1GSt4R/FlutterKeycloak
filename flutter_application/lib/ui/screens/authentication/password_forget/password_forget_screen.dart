import 'package:flutter/material.dart';
import 'package:oauth2_test/ui/shared_widgets/layout_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasswordForgetScreen extends ConsumerStatefulWidget {
  const PasswordForgetScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PasswordForgetScreenState();
}

class _PasswordForgetScreenState extends ConsumerState<PasswordForgetScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutWidget(
      context: context,
      title: 'Passwort Vergessen',
      child: Container(),
    );
  }
}
