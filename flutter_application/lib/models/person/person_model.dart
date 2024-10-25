import 'package:freezed_annotation/freezed_annotation.dart';

part 'person_model.freezed.dart';
part 'person_model.g.dart';

@freezed
class PersonModel with _$PersonModel {
  const factory PersonModel({
    required int id,
    required String firstName,
    required String lastName,
    required int age,
  }) = _PersonModel;

  factory PersonModel.fromJson(Map<String, Object?> json) => _$PersonModelFromJson(json);
}
