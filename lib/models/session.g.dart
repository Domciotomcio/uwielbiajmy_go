// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SessionImpl _$$SessionImplFromJson(Map<String, dynamic> json) =>
    _$SessionImpl(
      id: json['id'] as String?,
      name: json['name'] as String,
      chords:
          (json['chords'] as List<dynamic>).map((e) => e as String).toList(),
      currentSong: Song.fromJson(json['currentSong'] as Map<String, dynamic>),
      songs: (json['songs'] as List<dynamic>)
          .map((e) => Song.fromJson(e as Map<String, dynamic>))
          .toList(),
      users: (json['users'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$SessionImplToJson(_$SessionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'chords': instance.chords,
      'currentSong': instance.currentSong,
      'songs': instance.songs,
      'users': instance.users,
    };
