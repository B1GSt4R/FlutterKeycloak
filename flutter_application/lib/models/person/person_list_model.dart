import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oauth2_test/models/person/person_model.dart';

part 'person_list_model.freezed.dart';
part 'person_list_model.g.dart';

@freezed
abstract class PersonListModel with _$PersonListModel {
  const factory PersonListModel({
    required List<PersonModel> list,
  }) = _PersonListModel;

  factory PersonListModel.fromJson(Map<String, Object?> json) => _$PersonListModelFromJson(json);
}
