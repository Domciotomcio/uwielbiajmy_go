import 'package:flutter/material.dart';
import '../providers/song_list_provider.dart';
import '../providers/title_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'create_song_page.dart';
import 'song_page.dart';

class SongbookPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final songList = ref.watch(songListProvider);

    return ListView.builder(
      itemCount: songList.length,
      itemBuilder: (context, index) {
        final song = songList[index];
        return ListTile(
          title: Text(song.title),
          subtitle: Text(song.artist),
          onTap: () {
            // Navigacja do szczegółów piosenki
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => SongPage(song: song)),
            );
          },
        );
      },
    );
  }
}

class SongbookFloatingActionButton extends ConsumerWidget {
  const SongbookFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(onPressed:() {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateSongPage()));
      print("Dodaj piosenkę");
    }, child: Icon(Icons.add));
  }
}
