import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uwielbiajmy_go/models/song.dart';

class MyCreateSongPage extends StatefulWidget {
  const MyCreateSongPage({super.key});

  @override
  State<MyCreateSongPage> createState() => _MyCreateSongPageState();
}

class _MyCreateSongPageState extends State<MyCreateSongPage> {
  String title = '';

  final _formKey = GlobalKey<FormState>();

  // optional controllers
  final Map<String, String> _sectionTitleControllers = {
    "key": '',
    "artist": '',
    "language": '',
    "tempo": '',
    "bpm": '',
    "songbookNumber": '',
  };

  final List<Widget> sections = [];

  @override
  Widget build(BuildContext context) {
    void removeSection(Key key) {
      setState(() {
        sections.removeWhere((widget) => widget.key == key);
      });
    }

    void addNewSection() {
      final Key newKey = UniqueKey();

      sections.add(
        SectionWidget(
          key: newKey,
          onRemove: () {
            removeSection(newKey);
          },
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dodaj piosenkę'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                onChanged: (value) => setState(() => title = value),
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
                validator: (value) => stringValidator(value!),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Key',
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Artist',
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Language',
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Tempo',
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'BPM',
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Songbook number',
                ),
              ),
              for (var section in sections) ...[
                const Divider(),
                section,
              ],
              ElevatedButton(
                  onPressed: () => setState(() {
                        print("akcja");
                        addNewSection();
                        print(sections.length);
                      }),
                  child: const Text('Add section')),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            if (_sectionTitleControllers['bpm'] == null) {
              print('bpm is null');
              _sectionTitleControllers['bpm'] = '0';
            }

            var song = Song(
              title: title,
              key: _sectionTitleControllers['key'],
              artist: _sectionTitleControllers['artist'],
              language: _sectionTitleControllers['language'],
              tempo: _sectionTitleControllers['tempo'],
              bpm: _sectionTitleControllers['bpm'],
              songbookNumber: _sectionTitleControllers['songbookNumber'],
              sections: [],
              lyrics: {},
              chords: {},
            );
            // Handle song creation logic
            print('Creating song: $song');
          } else {
            print('Form is not valid');
          }
        },
        label: const Text('Stwórz piosenkę'),
      ),
    );
  }
}

class SectionWidget extends StatelessWidget {
  final VoidCallback onRemove;

  const SectionWidget({
    super.key,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Tytuł sekcji',
                ),
              ),
            ),
            ElevatedButton.icon(
                onPressed: () => onRemove(),
                icon: const Icon(Icons.delete),
                label: const Text('Usuń sekcję')),
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 3,
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Tekst',
                ),
              ),
            ),
            const SizedBox(width: 10.0),
            Expanded(
              flex: 1,
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Akordy',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

String? stringValidator(String value) {
  if (value.isEmpty) {
    return 'Brak tekstu';
  }
  return null;
}
