// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'person_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PersonListModel _$PersonListModelFromJson(Map<String, dynamic> json) {
  return _PersonListModel.fromJson(json);
}

/// @nodoc
mixin _$PersonListModel {
  List<PersonModel> get list => throw _privateConstructorUsedError;

  /// Serializes this PersonListModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PersonListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PersonListModelCopyWith<PersonListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonListModelCopyWith<$Res> {
  factory $PersonListModelCopyWith(
          PersonListModel value, $Res Function(PersonListModel) then) =
      _$PersonListModelCopyWithImpl<$Res, PersonListModel>;
  @useResult
  $Res call({List<PersonModel> list});
}

/// @nodoc
class _$PersonListModelCopyWithImpl<$Res, $Val extends PersonListModel>
    implements $PersonListModelCopyWith<$Res> {
  _$PersonListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PersonListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
  }) {
    return _then(_value.copyWith(
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<PersonModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PersonListModelImplCopyWith<$Res>
    implements $PersonListModelCopyWith<$Res> {
  factory _$$PersonListModelImplCopyWith(_$PersonListModelImpl value,
          $Res Function(_$PersonListModelImpl) then) =
      __$$PersonListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PersonModel> list});
}

/// @nodoc
class __$$PersonListModelImplCopyWithImpl<$Res>
    extends _$PersonListModelCopyWithImpl<$Res, _$PersonListModelImpl>
    implements _$$PersonListModelImplCopyWith<$Res> {
  __$$PersonListModelImplCopyWithImpl(
      _$PersonListModelImpl _value, $Res Function(_$PersonListModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PersonListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
  }) {
    return _then(_$PersonListModelImpl(
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<PersonModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PersonListModelImpl implements _PersonListModel {
  const _$PersonListModelImpl({required final List<PersonModel> list})
      : _list = list;

  factory _$PersonListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersonListModelImplFromJson(json);

  final List<PersonModel> _list;
  @override
  List<PersonModel> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  String toString() {
    return 'PersonListModel(list: $list)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonListModelImpl &&
            const DeepCollectionEquality().equals(other._list, _list));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_list));

  /// Create a copy of PersonListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonListModelImplCopyWith<_$PersonListModelImpl> get copyWith =>
      __$$PersonListModelImplCopyWithImpl<_$PersonListModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonListModelImplToJson(
      this,
    );
  }
}

abstract class _PersonListModel implements PersonListModel {
  const factory _PersonListModel({required final List<PersonModel> list}) =
      _$PersonListModelImpl;

  factory _PersonListModel.fromJson(Map<String, dynamic> json) =
      _$PersonListModelImpl.fromJson;

  @override
  List<PersonModel> get list;

  /// Create a copy of PersonListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PersonListModelImplCopyWith<_$PersonListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
