import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/song.dart';

final songListProvider = Provider<List<Song>>((ref) {
  return [
    Song(id: '1', title: 'Piosenka 1', artist: 'Artysta 1'),
    Song(id: '2', title: 'Piosenka 2', artist: 'Artysta 2'),
    Song(id: '3', title: 'Piosenka 3', artist: 'Artysta 3'),
    // Dodaj więcej piosenek
  ];
});
