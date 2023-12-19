import '../../models/song.dart';

abstract class SongService {
  Future<Song?> getSong(String id);
  Future<bool> addSong(Song song);
  Future<bool> updateSong(String id, Song song);
  Future<bool> deleteSong(String id);
}
