// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Session _$SessionFromJson(Map<String, dynamic> json) {
  return _Session.fromJson(json);
}

/// @nodoc
mixin _$Session {
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<String> get chords => throw _privateConstructorUsedError;
  Song get currentSong => throw _privateConstructorUsedError;
  List<Song> get songs => throw _privateConstructorUsedError;
  List<String> get users => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SessionCopyWith<Session> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionCopyWith<$Res> {
  factory $SessionCopyWith(Session value, $Res Function(Session) then) =
      _$SessionCopyWithImpl<$Res, Session>;
  @useResult
  $Res call(
      {String? id,
      String name,
      List<String> chords,
      Song currentSong,
      List<Song> songs,
      List<String> users});

  $SongCopyWith<$Res> get currentSong;
}

/// @nodoc
class _$SessionCopyWithImpl<$Res, $Val extends Session>
    implements $SessionCopyWith<$Res> {
  _$SessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? chords = null,
    Object? currentSong = null,
    Object? songs = null,
    Object? users = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      chords: null == chords
          ? _value.chords
          : chords // ignore: cast_nullable_to_non_nullable
              as List<String>,
      currentSong: null == currentSong
          ? _value.currentSong
          : currentSong // ignore: cast_nullable_to_non_nullable
              as Song,
      songs: null == songs
          ? _value.songs
          : songs // ignore: cast_nullable_to_non_nullable
              as List<Song>,
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SongCopyWith<$Res> get currentSong {
    return $SongCopyWith<$Res>(_value.currentSong, (value) {
      return _then(_value.copyWith(currentSong: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SessionImplCopyWith<$Res> implements $SessionCopyWith<$Res> {
  factory _$$SessionImplCopyWith(
          _$SessionImpl value, $Res Function(_$SessionImpl) then) =
      __$$SessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String name,
      List<String> chords,
      Song currentSong,
      List<Song> songs,
      List<String> users});

  @override
  $SongCopyWith<$Res> get currentSong;
}

/// @nodoc
class __$$SessionImplCopyWithImpl<$Res>
    extends _$SessionCopyWithImpl<$Res, _$SessionImpl>
    implements _$$SessionImplCopyWith<$Res> {
  __$$SessionImplCopyWithImpl(
      _$SessionImpl _value, $Res Function(_$SessionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? chords = null,
    Object? currentSong = null,
    Object? songs = null,
    Object? users = null,
  }) {
    return _then(_$SessionImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      chords: null == chords
          ? _value._chords
          : chords // ignore: cast_nullable_to_non_nullable
              as List<String>,
      currentSong: null == currentSong
          ? _value.currentSong
          : currentSong // ignore: cast_nullable_to_non_nullable
              as Song,
      songs: null == songs
          ? _value._songs
          : songs // ignore: cast_nullable_to_non_nullable
              as List<Song>,
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SessionImpl implements _Session {
  const _$SessionImpl(
      {this.id,
      required this.name,
      required final List<String> chords,
      required this.currentSong,
      required final List<Song> songs,
      required final List<String> users})
      : _chords = chords,
        _songs = songs,
        _users = users;

  factory _$SessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$SessionImplFromJson(json);

  @override
  final String? id;
  @override
  final String name;
  final List<String> _chords;
  @override
  List<String> get chords {
    if (_chords is EqualUnmodifiableListView) return _chords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chords);
  }

  @override
  final Song currentSong;
  final List<Song> _songs;
  @override
  List<Song> get songs {
    if (_songs is EqualUnmodifiableListView) return _songs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_songs);
  }

  final List<String> _users;
  @override
  List<String> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  @override
  String toString() {
    return 'Session(id: $id, name: $name, chords: $chords, currentSong: $currentSong, songs: $songs, users: $users)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._chords, _chords) &&
            (identical(other.currentSong, currentSong) ||
                other.currentSong == currentSong) &&
            const DeepCollectionEquality().equals(other._songs, _songs) &&
            const DeepCollectionEquality().equals(other._users, _users));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      const DeepCollectionEquality().hash(_chords),
      currentSong,
      const DeepCollectionEquality().hash(_songs),
      const DeepCollectionEquality().hash(_users));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionImplCopyWith<_$SessionImpl> get copyWith =>
      __$$SessionImplCopyWithImpl<_$SessionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SessionImplToJson(
      this,
    );
  }
}

abstract class _Session implements Session {
  const factory _Session(
      {final String? id,
      required final String name,
      required final List<String> chords,
      required final Song currentSong,
      required final List<Song> songs,
      required final List<String> users}) = _$SessionImpl;

  factory _Session.fromJson(Map<String, dynamic> json) = _$SessionImpl.fromJson;

  @override
  String? get id;
  @override
  String get name;
  @override
  List<String> get chords;
  @override
  Song get currentSong;
  @override
  List<Song> get songs;
  @override
  List<String> get users;
  @override
  @JsonKey(ignore: true)
  _$$SessionImplCopyWith<_$SessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
