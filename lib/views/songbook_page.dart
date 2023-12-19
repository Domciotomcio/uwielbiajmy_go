import 'package:flutter/material.dart';
import '../models/song.dart';
import '../providers/song_list_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'create_song_page.dart';
import 'song_page.dart';

class SongbookPage extends ConsumerWidget {
  const SongbookPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final songList = ref.watch(songListProvider);

    return songList.when(
      data: (songs) => _SongList(songs: songs),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(child: Text(error.toString())),
    );
  }
}

class _SongList extends StatelessWidget {
  const _SongList({Key? key, required this.songs}) : super(key: key);

  final List<Song> songs;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: songs.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        final song = songs[index];
        return ListTile(
          leading: Text(song.songbookNumber ?? '',
              style: Theme.of(context).textTheme.titleMedium),
          title: Text(song.title),
          subtitle: song.artist != null ? Text(song.artist!) : null,
          trailing: Text(song.key ?? ''),
          onTap: () {
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
    return FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => CreateSongPage()));
          print("Dodaj piosenkę");
        },
        child: const Icon(Icons.add));
  }
}
