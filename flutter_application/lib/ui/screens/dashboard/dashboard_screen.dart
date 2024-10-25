import 'package:flutter/material.dart';
import 'package:oauth2_test/ui/shared_widgets/layout_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  void onPerson() {
    context.pushNamed('persons');
  }

  void onLogout() {
    context.goNamed('login');
  }

  @override
  Widget build(BuildContext context) {
    return LayoutWidget(
      context: context,
      title: 'Dashboard',
      child: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: onPerson, child: const Text('Personen')),
            ElevatedButton(onPressed: onLogout, child: const Text('Abmelden')),
          ],
        ),
      ),
    );
  }
}
