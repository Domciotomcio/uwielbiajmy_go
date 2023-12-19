import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uwielbiajmy_go/services/songs/songs_service_firebase.dart';
import 'package:uwielbiajmy_go/services/songs/songs_service_mock.dart';

import '../models/song.dart';

part 'song_list_provider.g.dart';

@riverpod
Future<List<Song>> songList(SongListRef ref) async {
  //final songService = SongsServiceMock();
  final songService = SongsServiceFirebase();

  final songs = await songService.getSongs();
  return songs;
}
