import 'package:flutter/material.dart';

import '../models/song.dart';

class SongPage extends StatelessWidget {
  final Song song;

  SongPage({required this.song});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(song.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(song.title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Artysta: ${song.artist}'),
            // Możesz dodać więcej szczegółów piosenki
          ],
        ),
      ),
    );
  }
}
