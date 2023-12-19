import '../../models/song.dart';

abstract class SongsService {
  Future<List<Song>> getSongs();
}
