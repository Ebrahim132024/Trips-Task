// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TripModel _$TripModelFromJson(Map<String, dynamic> json) {
  return _TripModel.fromJson(json);
}

/// @nodoc
mixin _$TripModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'cover_image')
  String get coverImage => throw _privateConstructorUsedError;
  Map<String, String> get dates => throw _privateConstructorUsedError;
  List<Map<String, String>> get participants =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'unfinished_tasks')
  int get unfinishedTasks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TripModelCopyWith<TripModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TripModelCopyWith<$Res> {
  factory $TripModelCopyWith(TripModel value, $Res Function(TripModel) then) =
      _$TripModelCopyWithImpl<$Res, TripModel>;
  @useResult
  $Res call(
      {String id,
      String title,
      String status,
      @JsonKey(name: 'cover_image') String coverImage,
      Map<String, String> dates,
      List<Map<String, String>> participants,
      @JsonKey(name: 'unfinished_tasks') int unfinishedTasks});
}

/// @nodoc
class _$TripModelCopyWithImpl<$Res, $Val extends TripModel>
    implements $TripModelCopyWith<$Res> {
  _$TripModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? status = null,
    Object? coverImage = null,
    Object? dates = null,
    Object? participants = null,
    Object? unfinishedTasks = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      coverImage: null == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as String,
      dates: null == dates
          ? _value.dates
          : dates // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      participants: null == participants
          ? _value.participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<Map<String, String>>,
      unfinishedTasks: null == unfinishedTasks
          ? _value.unfinishedTasks
          : unfinishedTasks // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TripModelImplCopyWith<$Res>
    implements $TripModelCopyWith<$Res> {
  factory _$$TripModelImplCopyWith(
          _$TripModelImpl value, $Res Function(_$TripModelImpl) then) =
      __$$TripModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String status,
      @JsonKey(name: 'cover_image') String coverImage,
      Map<String, String> dates,
      List<Map<String, String>> participants,
      @JsonKey(name: 'unfinished_tasks') int unfinishedTasks});
}

/// @nodoc
class __$$TripModelImplCopyWithImpl<$Res>
    extends _$TripModelCopyWithImpl<$Res, _$TripModelImpl>
    implements _$$TripModelImplCopyWith<$Res> {
  __$$TripModelImplCopyWithImpl(
      _$TripModelImpl _value, $Res Function(_$TripModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? status = null,
    Object? coverImage = null,
    Object? dates = null,
    Object? participants = null,
    Object? unfinishedTasks = null,
  }) {
    return _then(_$TripModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      coverImage: null == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as String,
      dates: null == dates
          ? _value._dates
          : dates // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      participants: null == participants
          ? _value._participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<Map<String, String>>,
      unfinishedTasks: null == unfinishedTasks
          ? _value.unfinishedTasks
          : unfinishedTasks // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TripModelImpl implements _TripModel {
  const _$TripModelImpl(
      {this.id = '',
      this.title = '',
      this.status = '',
      @JsonKey(name: 'cover_image') this.coverImage = '',
      final Map<String, String> dates = const {},
      final List<Map<String, String>> participants = const [],
      @JsonKey(name: 'unfinished_tasks') this.unfinishedTasks = 0})
      : _dates = dates,
        _participants = participants;

  factory _$TripModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TripModelImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey(name: 'cover_image')
  final String coverImage;
  final Map<String, String> _dates;
  @override
  @JsonKey()
  Map<String, String> get dates {
    if (_dates is EqualUnmodifiableMapView) return _dates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_dates);
  }

  final List<Map<String, String>> _participants;
  @override
  @JsonKey()
  List<Map<String, String>> get participants {
    if (_participants is EqualUnmodifiableListView) return _participants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_participants);
  }

  @override
  @JsonKey(name: 'unfinished_tasks')
  final int unfinishedTasks;

  @override
  String toString() {
    return 'TripModel(id: $id, title: $title, status: $status, coverImage: $coverImage, dates: $dates, participants: $participants, unfinishedTasks: $unfinishedTasks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TripModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.coverImage, coverImage) ||
                other.coverImage == coverImage) &&
            const DeepCollectionEquality().equals(other._dates, _dates) &&
            const DeepCollectionEquality()
                .equals(other._participants, _participants) &&
            (identical(other.unfinishedTasks, unfinishedTasks) ||
                other.unfinishedTasks == unfinishedTasks));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      status,
      coverImage,
      const DeepCollectionEquality().hash(_dates),
      const DeepCollectionEquality().hash(_participants),
      unfinishedTasks);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TripModelImplCopyWith<_$TripModelImpl> get copyWith =>
      __$$TripModelImplCopyWithImpl<_$TripModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TripModelImplToJson(
      this,
    );
  }
}

abstract class _TripModel implements TripModel {
  const factory _TripModel(
          {final String id,
          final String title,
          final String status,
          @JsonKey(name: 'cover_image') final String coverImage,
          final Map<String, String> dates,
          final List<Map<String, String>> participants,
          @JsonKey(name: 'unfinished_tasks') final int unfinishedTasks}) =
      _$TripModelImpl;

  factory _TripModel.fromJson(Map<String, dynamic> json) =
      _$TripModelImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get status;
  @override
  @JsonKey(name: 'cover_image')
  String get coverImage;
  @override
  Map<String, String> get dates;
  @override
  List<Map<String, String>> get participants;
  @override
  @JsonKey(name: 'unfinished_tasks')
  int get unfinishedTasks;
  @override
  @JsonKey(ignore: true)
  _$$TripModelImplCopyWith<_$TripModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
