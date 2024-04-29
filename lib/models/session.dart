import 'package:freezed_annotation/freezed_annotation.dart';

import 'song.dart';

part 'session.freezed.dart';
part 'session.g.dart';

@freezed
abstract class Session with _$Session {
  const factory Session({
    String? id,
    required String name,
    required List<String> chords,
    required Song currentSong,
    required List<Song> songs,
    required List<String> users,
  }) = _Session;

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);
}
