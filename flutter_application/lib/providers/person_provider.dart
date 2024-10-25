import 'package:oauth2_test/models/person/person_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'person_provider.g.dart';

@riverpod
class Person extends _$Person {
  List<PersonModel> list = List.empty(growable: true);

  @override
  Future<List<PersonModel>> build() async {
    return getAsync();
  }

  Future<List<PersonModel>> getAsync() async {
    list = List.generate(5, (index) {
      return PersonModel(id: index + 1, firstName: 'Vorname $index', lastName: 'Nachname $index', age: index + 19);
    }, growable: true);
    return list;
  }

  PersonModel getSingle(int id) {
    return list.firstWhere((x) => x.id == id);
  }

  void addItem(PersonModel data) {
    list.add(data);
  }

  void removeItem(int id) {
    list.removeWhere((x) => x.id == id);
  }
}
