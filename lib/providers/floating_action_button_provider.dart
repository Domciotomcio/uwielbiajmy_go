import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../constants/destinations.dart';
import 'selected_index_provider.dart';

final floatingActionButtonProvider = Provider<Widget?>((ref) {
  final selectedIndex = ref.watch(selectedIndexProvider);
  return menuDestinations[selectedIndex].floatingActionButton;
});
