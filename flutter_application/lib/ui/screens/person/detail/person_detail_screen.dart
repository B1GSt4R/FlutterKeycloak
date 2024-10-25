import 'package:flutter/material.dart';
import 'package:oauth2_test/providers/person_provider.dart';
import 'package:oauth2_test/ui/shared_widgets/layout_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PersonDetailScreen extends ConsumerStatefulWidget {
  final int id;
  const PersonDetailScreen({super.key, required this.id});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PersonDetailScreenState();
}

class _PersonDetailScreenState extends ConsumerState<PersonDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final item = ref.read(personProvider.notifier).getSingle(widget.id);
    return LayoutWidget(
      context: context,
      title: 'Personen Details',
      child: Column(
        children: [
          Text('${item.id}'),
          Text(item.firstName),
          Text(item.lastName),
          Text('${item.age}'),
        ],
      ),
    );
  }
}
