import 'package:flutter/material.dart';

import '../models/destination.dart';
import '../views/create_song_page.dart';
import '../views/home_page.dart';
import '../views/jam_page.dart';
import '../views/songbook_page.dart';

List<Destination> menuDestinations = [
  Destination(
    selectedIcon: Icons.home,
    icon: Icons.home_outlined,
    label: 'Strona Główna',
    page: HomePage(),
    title: 'Strona Główna',
    floatingActionButton: null,
  ),
  Destination(
      selectedIcon: Icons.book_online,
      icon: Icons.book_online_outlined,
      label: 'Śpiewnik',
      page: SongbookPage(),
      title: 'Śpiewnik',
      floatingActionButton: SongbookFloatingActionButton()),
  Destination(
    selectedIcon: Icons.music_note,
    icon: Icons.music_note_outlined,
    label: 'Uwielbiajmy Razem',
    page: JamPage(),
    title: 'Uwielbiajmy Razem',
    floatingActionButton: JamFloatingActionButton(),
  ),
  // add more destinations here
];

Map<String, String> ChordsUp = {
  'C': 'C#',
  'C#': 'D',
  'D': 'D#',
  'D#': 'E',
  'E': 'F',
  'F': 'F#',
  'F#': 'G',
  'G': 'G#',
  'G#': 'A',
  'A': 'A#',
  'A#': 'H',
  'H': 'C',
};
