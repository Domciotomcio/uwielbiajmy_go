import 'package:flutter/material.dart';

import '../models/destination.dart';
import '../views/home_page.dart';
import '../views/jam_page.dart';
import '../views/songbook_page.dart';

List<Destination> destinations = [
  Destination(
    selectedIcon: Icons.home,
    icon: Icons.home_outlined,
    label: 'Strona główna',
    page: HomePage(),
    title: 'Strona główna',
    floatingActionButton: null,
  ),
  Destination(
      selectedIcon: Icons.book_online,
      icon: Icons.book_online_outlined,
      label: 'Śpiewnik',
      page: SongbookPage(),
      title: 'Śpiewnik',
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Dodaj piosenkę");
        },
        child: const Icon(Icons.add),
        
      )),
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
