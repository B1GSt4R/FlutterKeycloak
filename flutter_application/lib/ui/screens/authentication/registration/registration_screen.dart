import 'package:flutter/material.dart';
import 'package:oauth2_test/ui/shared_widgets/layout_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegistrationScreen extends ConsumerStatefulWidget {
  const RegistrationScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends ConsumerState<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutWidget(
      context: context,
      title: 'Registrierung',
      child: Container(),
    );
  }
}
