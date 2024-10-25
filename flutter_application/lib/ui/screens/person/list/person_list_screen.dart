import 'package:flutter/material.dart';
import 'package:oauth2_test/providers/person_provider.dart';
import 'package:oauth2_test/ui/shared_widgets/layout_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PersonListScreen extends ConsumerStatefulWidget {
  const PersonListScreen({super.key, String? search});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PersonListScreenState();
}

class _PersonListScreenState extends ConsumerState<PersonListScreen> {
  void onDetails(int id) {
    context.pushNamed('person-details', pathParameters: {'id': id.toString()});
  }

  @override
  Widget build(BuildContext context) {
    final list = ref.watch(personProvider);
    return LayoutWidget(
      context: context,
      title: 'Personen',
      child: list.when(
        data: (item) {
          return ListView.builder(
            itemCount: item.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('${item[index].lastName}, ${item[index].firstName}'),
                subtitle: Text('Alter: ${item[index].age}'),
                onTap: () => onDetails(item[index].id),
              );
            },
          );
        },
        error: (error, stackTrace) {
          return Text(stackTrace.toString());
        },
        loading: () {
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
