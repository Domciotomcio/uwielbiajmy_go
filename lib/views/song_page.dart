import 'dart:math';

import 'package:flutter/material.dart';

import '../models/song.dart';

class ActiveView {
  final String viewName;
  final Icon viewIcon;

  ActiveView(this.viewName, this.viewIcon);
}

class SongPage extends StatefulWidget {
  final Song song;

  SongPage({required this.song});

  @override
  State<SongPage> createState() => _SongPageState();
}

List<ActiveView> activeViewOptions = [
  ActiveView("Chords", Icon(Icons.music_note)),
  ActiveView("Lyrics", Icon(Icons.text_fields)),
  ActiveView("Combined", Icon(Icons.format_align_left)),
];

class _SongPageState extends State<SongPage> {
  ActiveView activeView = activeViewOptions[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.song.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.song.title,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              //Text('Artysta: ${widget.song.artist}'),
              // Możesz dodać więcej szczegółów piosenki

              SizedBox(height: 16),

              // Wyświetl tekst piosenki
              if (activeView.viewName == "Chords")
                SongChordsWidget(song: widget.song),
              if (activeView.viewName == "Lyrics")
                SongLyricsWidget(song: widget.song),
              if (activeView.viewName == "Combined")
                SongCombinedWidget(song: widget.song),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            activeView = activeViewOptions[
                (activeViewOptions.indexOf(activeView) + 1) %
                    activeViewOptions.length];
            print(activeView);
          });
        },
        child: activeView.viewIcon,
        //child: activeView.viewIcon,
      ),
    );
  }
}

class SongChordsWidget extends StatelessWidget {
  final Song song;

  SongChordsWidget({Key? key, required this.song}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: song.sections.map((section) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(section,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            if (song.chords[section] != null)
              ...song.chords[section]!.map((line) => Text(line)).toList(),
            SizedBox(height: 16),
          ],
        );
      }).toList(),
    );
  }
}

class SongLyricsWidget extends StatelessWidget {
  final Song song;

  SongLyricsWidget({Key? key, required this.song}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: song.sections.map((section) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(section,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            if (song.lyrics[section] != null)
              ...song.lyrics[section]!.map((line) => Text(line)).toList(),
            SizedBox(height: 16),
          ],
        );
      }).toList(),
    );
  }
}

class SongCombinedWidget extends StatelessWidget {
  final Song song;

  SongCombinedWidget({Key? key, required this.song}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: song.sections.map((section) {
        // Get the list of lyrics and chords for the section, filling in blanks if one is shorter
        List<String> sectionLyrics = song.lyrics[section] ?? [];
        List<String> sectionChords = song.chords[section] ?? [];
        int maxLines = max(sectionLyrics.length, sectionChords.length);

        List<Widget> sectionWidgets = [
          Text(section,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
        ];

        for (int i = 0; i < maxLines; i++) {
          String lyricLine = i < sectionLyrics.length ? sectionLyrics[i] : "";
          String chordLine = i < sectionChords.length ? sectionChords[i] : "";

          sectionWidgets.add(
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Text(lyricLine),
                ),
                SizedBox(width: 8),
                Expanded(
                  flex: 1,
                  child: Text(chordLine),
                ),
              ],
            ),
          );
        }

        sectionWidgets.add(SizedBox(height: 16));
        return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: sectionWidgets);
      }).toList(),
    );
  }
}
