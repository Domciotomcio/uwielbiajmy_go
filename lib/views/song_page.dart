import 'dart:math';

import 'package:flutter/material.dart';

import '../models/song.dart';

class ActiveView {
  final String viewName;
  final Icon viewIcon;
  final Widget Function(Song song) viewBuilder;

  ActiveView(this.viewName, this.viewIcon, this.viewBuilder);
}

class SongPage extends StatefulWidget {
  final Song song;

  SongPage({required this.song});

  @override
  State<SongPage> createState() => _SongPageState();
}

List<ActiveView> activeViewOptions = [
  ActiveView("Chords", Icon(Icons.music_note),
      (Song song) => SongChordsWidget(song: song)),
  ActiveView("Lyrics", Icon(Icons.text_fields),
      (Song song) => SongLyricsWidget(song: song)),
  ActiveView("Combined", Icon(Icons.format_align_left),
      (Song song) => SongCombinedWidget(song: song)),
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
          child: Container(
            child: AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                child: activeView.viewBuilder(widget.song)),
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
      ),
    );
  }

  Widget getViewForActiveOption() {
    Widget currentView;
    switch (activeView.viewName) {
      case "Chords":
        currentView = SongChordsWidget(song: widget.song);
        break;
      case "Lyrics":
        currentView = SongLyricsWidget(song: widget.song);
        break;
      default: // "Combined"
        currentView = SongCombinedWidget(song: widget.song);
        break;
    }

    return ConstrainedBox(
      constraints:
          BoxConstraints(minHeight: 200), // Adjust the height as needed
      child: currentView,
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
                  child: Text(chordLine,
                      style: TextStyle(fontWeight: FontWeight.bold)),
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
