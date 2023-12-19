import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uwielbiajmy_go/models/song.dart';
import 'package:uwielbiajmy_go/services/songs/songs_service.dart';

class SongsServiceFirebase implements SongsService {
  @override
  Future<List<Song>> getSongs() async {
    try {
      List<Song> songs = [];

      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('songs').get();

      for (var doc in snapshot.docs) {
        Song song = Song.fromJson(doc.data() as Map<String, dynamic>);
        songs.add(Song.withId(doc.id, song));
      }

      return songs;
    } catch (e) {
      log("Error while getting songs from Firebase: $e");
      return [];
    }
  }
}
