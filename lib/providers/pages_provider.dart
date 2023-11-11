import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uwielbiajmy_go/constants/destinations.dart';

import '../views/home_page.dart';
import '../views/jam_page.dart';
import '../views/songbook_page.dart';

final pagesProvider = Provider<List<Widget>>(
    (ref) => destinations.map((destination) => destination.page).toList());
