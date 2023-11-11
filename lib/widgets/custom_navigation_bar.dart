import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/page_controller_provider.dart';
import '../providers/selected_index_provider.dart';
import '../views/home_page.dart';
import '../views/jam_page.dart';
import '../views/songbook_page.dart';

class CustomNavigationBar extends ConsumerWidget {
  const CustomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedIndexProvider);
    final pageController = ref.watch(pageControllerProvider);

    return NavigationBar(
      onDestinationSelected: (int index) {
        ref.read(selectedIndexProvider.notifier).state = index;
        // pageController.animateToPage(index,
        //     duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      },
      selectedIndex: selectedIndex,
      destinations: const [
        NavigationDestination(
          selectedIcon: Icon(Icons.home),
          icon: Icon(Icons.home_outlined),
          label: 'Strona główna',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.book_online),
          icon: Icon(Icons.book_online_outlined),
          label: 'Śpiewnik',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.music_note),
          icon: Icon(Icons.music_note_outlined),
          label: 'Uwielbiajmy Razem',
        ),
      ],
    );
  }
}
