import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'song.freezed.dart';
part 'song.g.dart';

@freezed
class Song with _$Song {
  const factory Song({
    required String id,
    required String title,
    required String key,
    required String artist,
    required String language,
    required String tempo,
    required int bpm,
    required String songbookNumber,
    required List<String> sections,
    required Map<String, List<String>> lyrics,
    required Map<String, List<String>> chords,
  }) = _Song;

  factory Song.fromJson(Map<String, dynamic> json) => _$SongFromJson(json);
}
