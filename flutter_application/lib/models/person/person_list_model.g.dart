// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PersonListModelImpl _$$PersonListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PersonListModelImpl(
      list: (json['list'] as List<dynamic>)
          .map((e) => PersonModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PersonListModelImplToJson(
        _$PersonListModelImpl instance) =>
    <String, dynamic>{
      'list': instance.list,
    };
