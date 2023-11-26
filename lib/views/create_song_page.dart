import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stwórz piosenkę'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Tytuł'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Podaj tytuł piosenki';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _lyricsController,
                decoration: InputDecoration(labelText: 'Lyrics'),
                keyboardType: TextInputType.multiline,
                maxLines: null, // Allows multiline input
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Handle song creation logic
                    print('Creating song with title: ${_titleController.text}');
                  }
                },
                child: Text('Create Song'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
