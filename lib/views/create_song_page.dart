import 'dart:math';

import 'package:flutter/material.dart';
import 'package:uwielbiajmy_go/models/music_section_model.dart';

import '../models/song.dart';

class CreateSongPage extends StatefulWidget {
  @override
  _CreateSongPageState createState() => _CreateSongPageState();
}

class _CreateSongPageState extends State<CreateSongPage> {
  final _formKey = GlobalKey<FormState>();
  // Define controllers for text fields
  TextEditingController _titleController = TextEditingController();
  TextEditingController _artistController = TextEditingController();
  TextEditingController _lyricsController = TextEditingController();

  List<MusicSection> _sections = [];

  void _addNewSection() {
    setState(() {
      int newIndex = _sections.length;
      _sections.add(MusicSection(
        index: newIndex,
        onDelete: () => _removeSection(newIndex),
      ));
      print('Added new section at index $newIndex');
    });
  }

  void _removeSection(int index) {
    setState(() {
      _sections.removeWhere((element) => element.index == index);
    });
  }

  @override
  void dispose() {
    for (var section in _sections) {}
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stwórz piosenkę'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Tytuł'),
                          validator: (value) => stringValidator(value!),
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: TextFormField(
                                decoration: InputDecoration(labelText: 'Autor'),
                                validator: (value) => stringValidator(value!),
                              ),
                            ),
                            SizedBox(width: 16.0),
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                decoration:
                                    InputDecoration(labelText: 'Tonacja'),
                                validator: (value) => stringValidator(value!),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                for (var section in _sections)
                  Column(
                    children: [
                      Divider(),
                      section,
                    ],
                  ),
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          _addNewSection();
                          print("HEJ");
                        },
                        child: Text('Dodaj sekcję')),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              var song = Song(
                id: '1',
                title: _titleController.text,
                artist: _artistController.text,
                key: 'C',
                language: 'PL',
                tempo: '4/4',
                bpm: 120,
                songbookNumber: '1',
                sections: [],
                lyrics: {},
                chords: {},
              );
              // Handle song creation logic
              print('Creating song with title: ${_titleController.text}');
            }
          },
          label: Text('Stwórz piosenkę')),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class MusicSection extends StatefulWidget {
  final int index;
  final Function onDelete;

  MusicSection({super.key, required this.index, required this.onDelete});

  @override
  State<MusicSection> createState() => _MusicSectionState();
}

class _MusicSectionState extends State<MusicSection> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController lyricsController = TextEditingController();

  final TextEditingController chordsController = TextEditingController();

  MusicSectionModel get model {
    var lyricsList = lyricsController.text.split('\n');
    var chordsList = chordsController.text.split('\n');

    return MusicSectionModel(
      title: titleController.text,
      lyrics: lyricsList,
      chords: chordsList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: TextFormField(
                    controller: titleController,
                    decoration: InputDecoration(
                      labelText: 'Nazwa Sekcji',
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        widget.onDelete();
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: TextFormField(
                    controller: lyricsController,
                    decoration: InputDecoration(
                      labelText: 'Słowa',
                    ),
                    maxLines: null, // Allows multiple lines
                  ),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    controller: chordsController,
                    decoration: InputDecoration(
                      labelText: 'Chwyty',
                    ),
                    maxLines: null, // Allows multiple lines
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

String? stringValidator(String value) {
  if (value.isEmpty) {
    return 'Brak tekstu';
  }
  return null;
}
