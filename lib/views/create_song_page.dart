import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uwielbiajmy_go/models/song.dart';
import 'package:uwielbiajmy_go/providers/song_controller.dart';

class CreateSongPage extends ConsumerStatefulWidget {
  const CreateSongPage({super.key});

  @override
  ConsumerState<CreateSongPage> createState() => _MyCreateSongPageState();
}

class _MyCreateSongPageState extends ConsumerState<CreateSongPage> {
  Future<void>? _addingSong;

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

  final List<SectionWidget> sections = [];

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

  @override
  Widget build(BuildContext context) {
    List<Widget> buildTextFormFields() {
      return _sectionTitleControllers.keys.map((String key) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextFormField(
            decoration: InputDecoration(
              labelText: key,
            ),
            onChanged: (value) {
              setState(() {
                _sectionTitleControllers[key] = value;
              });
            },
          ),
        );
      }).toList();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dodaj piosenkę'),
      ),
      body: MainView(buildTextFormFields),
      floatingActionButton: FutureBuilder(
        future: _addingSong,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return FloatingActionButton.extended(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.check),
              label: const Text('Dodano piosenkę'),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            return FloatingActionButton.extended(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();

                  List<String> mySections = [];
                  Map<String, List<String>> myLyrics = {};
                  Map<String, List<String>> myChords = {};

                  for (var section in sections) {
                    mySections.add(section.title);
                    myLyrics[section.title] = section.text;
                    myChords[section.title] = section.chords;
                  }

                  if (_sectionTitleControllers['bpm'] == null) {
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
                    sections: mySections,
                    lyrics: myLyrics,
                    chords: myChords,
                  );
                  // Handle song creation logic
                  print('Creating song: $song');

                  final future =
                      ref.read(songControllerProvider.notifier).addSong(song);

                  setState(() {
                    _addingSong = future;
                  });
                } else {
                  print('Form is not valid');
                }
              },
              icon: const Icon(Icons.add),
              label: const Text('Dodaj piosenkę'),
            );
          }
        },
      ),
    );
  }

  Form MainView(List<Widget> Function() buildTextFormFields) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (value) => setState(() => title = value),
                    decoration: const InputDecoration(
                      labelText: 'Title',
                    ),
                    validator: (value) => stringValidator(value!),
                  ),
                ),
              ),
              // for key, tempo, artist, language, bpm, songbookNumber
              ...buildTextFormFields(),

              for (var section in sections) ...[
                const Divider(height: 30),
                section,
              ],
              const SizedBox(
                height: 10.0,
              ),
              ElevatedButton(
                onPressed: () => setState(() {
                  print("akcja");
                  addNewSection();
                  print(sections.length);
                }),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 40),
                ),
                child: const Text('Dodaj sekcję'),
              ),
              const SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionWidget extends StatelessWidget {
  final VoidCallback onRemove;

  String title = '';
  List<String> text = [];
  List<String> chords = [];

  void saveText(String value) {
    text = value.split('\n');
  }

  void saveChords(String value) {
    chords = value.split('\n');
  }

  SectionWidget({
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
              child: Card(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Tytuł sekcji',
                    ),
                    validator: (value) => stringValidator(value!),
                    onSaved: (newValue) => title = newValue!,
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () => onRemove(),
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Tekst',
                  ),
                  onSaved: (newValue) => saveText(newValue!),
                  maxLines: null,
                ),
              ),
              const SizedBox(width: 10.0),
              Expanded(
                flex: 1,
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Akordy',
                  ),
                  onSaved: (newValue) => saveChords(newValue!),
                  maxLines: null,
                ),
              ),
            ],
          ),
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
