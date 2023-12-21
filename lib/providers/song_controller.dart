import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uwielbiajmy_go/providers/song_list_provider.dart';
import 'package:uwielbiajmy_go/services/song/song_service.dart';
import 'package:uwielbiajmy_go/services/song/song_service_firebase.dart';
import 'package:uwielbiajmy_go/services/songs/songs_service.dart';

import '../models/song.dart';
import '../services/songs/songs_service_firebase.dart';

part 'song_controller.g.dart';

@riverpod
class SongController extends _$SongController {
  late SongService songService = SongServiceFirebase();
  late SongsService songsService = SongsServiceFirebase();

  @override
  Future<List<Song>> build() async {
    return [];
  }

  Future<void> getSongs() async {
    //await Future.delayed(const Duration(seconds: 5));
    final songs = await songsService.getSongs();
    print(songs);

    state = AsyncData(songs);
  }

  Future<void> addSong(Song song) async {
    await Future.delayed(const Duration(seconds: 2));
    await songService.addSong(song);
    print('Song added');
    await getSongs();
    ref.invalidate(songListProvider); // refresh song list
  }
}
