// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:uwielbiajmy_go/models/music_section_model.dart';

// import '../models/song.dart';

// // riverpod provider for sections
// final sectionsProvider = StateProvider<List<MyMusicSection>>((ref) => []);

// class CreateSongPage extends StatefulWidget {
//   const CreateSongPage({Key? key}) : super(key: key);

//   @override
//   _CreateSongPageState createState() => _CreateSongPageState();
// }

// class _CreateSongPageState extends State<CreateSongPage> {
//   final _formKey = GlobalKey<FormState>();

//   // required controllers
//   final TextEditingController _titleController = TextEditingController();

//   // optional controllers
//   final Map<String, TextEditingController> _sectionTitleControllers = {
//     'key': TextEditingController(),
//     'artist': TextEditingController(),
//     'language': TextEditingController(),
//     'tempo': TextEditingController(),
//     'bpm': TextEditingController(),
//     'songbookNumber': TextEditingController(),
//   };

//   void _addNewSection() {
//     final sections = context.read(sectionsProvider);
//   }

//   void _removeSection(int index) {
//     setState(() {
//       _sections.removeWhere((element) => element.index == index);
//     });
//   }

//   @override
//   void dispose() {
//     _titleController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Stwórz piosenkę'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Form(
//           key: _formKey,
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 _BasicInfoWidget(
//                   titleController: _titleController,
//                 ),
//                 for (var section in _sections) ...[
//                   const Divider(),
//                   section,
//                 ],
//                 Row(
//                   children: [
//                     ElevatedButton(
//                       onPressed: () {
//                         _addNewSection();
//                       },
//                       child: const Text('Dodaj sekcję'),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: () {
//           if (_formKey.currentState!.validate()) {
//             var song = Song(
//               title: _titleController.text,
//               sections: [],
//               lyrics: {},
//               chords: {},
//             );
//             // Handle song creation logic
//             print('Creating song: $song');
//           } else {
//             print('Form is not valid');
//           }
//         },
//         label: const Text('Stwórz piosenkę'),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
//     );
//   }
// }

// class _BasicInfoWidget extends StatelessWidget {
//   const _BasicInfoWidget({
//     required TextEditingController titleController,
//   }) : _titleController = titleController;

//   final TextEditingController _titleController;

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             TextFormField(
//               controller: _titleController,
//               decoration: const InputDecoration(labelText: 'Tytuł'),
//               validator: (value) => stringValidator(value!),
//             ),
//             Row(
//               children: [
//                 Expanded(
//                   flex: 3,
//                   child: TextFormField(
//                     decoration: const InputDecoration(labelText: 'Autor'),
//                   ),
//                 ),
//                 const SizedBox(width: 16.0),
//                 Expanded(
//                   flex: 1,
//                   child: TextFormField(
//                     decoration: const InputDecoration(labelText: 'Tonacja'),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // class _Section extends StatefulWidget {
// //   final int index;
// //   final Function onDelete;

// //   const MusicSection({super.key, required this.index, required this.onDelete});

// //   @override
// //   State<MusicSection> createState() => _MusicSectionState();
// // }

// // class _SectionWidget extends StatelessWidget{
// //   final int index;
// //   final Function onDelete;

// //   final TextEditingController titleController = TextEditingController();
// //   final TextEditingController lyricsController = TextEditingController();
// //   final TextEditingController chordsController = TextEditingController();

// //   @override
// //   void dispose() {
// //     titleController.dispose();
// //     lyricsController.dispose();
// //     chordsController.dispose();
// //     super.dispose();
// //   }

// //   MusicSectionModel get model {
// //     var lyricsList = lyricsController.text.split('\n');
// //     var chordsList = chordsController.text.split('\n');

// //     return MusicSectionModel(
// //       title: titleController.text,
// //       lyrics: lyricsList,
// //       chords: chordsList,
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Card(
// //       child: Padding(
// //         padding: const EdgeInsets.all(8.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: <Widget>[
// //             Row(
// //               children: [
// //                 Expanded(
// //                   flex: 3,
// //                   child: TextFormField(
// //                     controller: titleController,
// //                     decoration: const InputDecoration(
// //                       labelText: 'Nazwa Sekcji',
// //                     ),
// //                     validator: (value) => stringValidator(value!),
// //                   ),
// //                 ),
// //                 Expanded(
// //                   flex: 2,
// //                   child: Container(
// //                     alignment: Alignment.centerRight,
// //                     child: IconButton(
// //                       onPressed: () {
// //                         widget.onDelete();
// //                       },
// //                       icon: const Icon(Icons.delete),
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //             const SizedBox(height: 8.0),
// //             Row(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Expanded(
// //                   flex: 3,
// //                   child: TextFormField(
// //                     controller: lyricsController,
// //                     decoration: const InputDecoration(
// //                       labelText: 'Słowa',
// //                     ),
// //                     maxLines: null, // Allows multiple lines
// //                   ),
// //                 ),
// //                 const SizedBox(width: 8.0),
// //                 Expanded(
// //                   flex: 2,
// //                   child: TextFormField(
// //                     controller: chordsController,
// //                     decoration: const InputDecoration(
// //                       labelText: 'Chwyty',
// //                     ),
// //                     maxLines: null, // Allows multiple lines
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// String? stringValidator(String value) {
//   if (value.isEmpty) {
//     return 'Brak tekstu';
//   }
//   return null;
// }

// class MyMusicSection extends StatelessWidget {
//   final int index;

//   final TextEditingController titleController = TextEditingController();
//   final TextEditingController lyricsController = TextEditingController();
//   final TextEditingController chordsController = TextEditingController();

//   MyMusicSection({super.key, required this.index});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Text("Something $index"),
//         IconButton(
//           onPressed: () {
//             // widget.onDelete();
//           },
//           icon: const Icon(Icons.delete),
//         ),
//       ],
//     );
//   }
// }
