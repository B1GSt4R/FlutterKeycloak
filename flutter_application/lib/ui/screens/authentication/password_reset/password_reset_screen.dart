import 'package:flutter/material.dart';
import 'package:oauth2_test/ui/shared_widgets/layout_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasswordResetScreen extends ConsumerStatefulWidget {
  const PasswordResetScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PasswordResetScreenState();
}

class _PasswordResetScreenState extends ConsumerState<PasswordResetScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutWidget(
      context: context,
      title: 'Passwort Reset',
      child: Container(),
    );
  }
}
