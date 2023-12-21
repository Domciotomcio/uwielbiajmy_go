import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uwielbiajmy_go/models/song.dart';
import 'package:uwielbiajmy_go/services/song/song_service.dart';

class SongServiceFirebase implements SongService {
  @override
  Future<Song?> getSong(String id) async {
    try {
      final songSnapshot =
          await FirebaseFirestore.instance.collection('songs').doc(id).get();
      if (songSnapshot.exists) {
        final songData = songSnapshot.data()!;
        return Song.fromJson(songData);
      } else {
        throw Exception(
            'Song not found'); // Throw an exception when the song is not found
      }
    } catch (e) {
      log('Error while getting song: $e');
      return null;
    }
  }

  @override
  Future<bool> addSong(Song song) async {
    try {
      final songData = song.toJson();
      FirebaseFirestore.instance.collection('songs').add(songData);
      return true;
    } catch (e) {
      log('Error while adding song: $e');
      return false;
    }
  }

  @override
  Future<bool> deleteSong(String id) {
    // TODO: implement deleteSong
    throw UnimplementedError();
  }

  @override
  Future<bool> updateSong(String id, Song song) {
    // TODO: implement updateSong
    throw UnimplementedError();
  }
}
