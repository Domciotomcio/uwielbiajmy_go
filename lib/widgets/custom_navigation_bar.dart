import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/destinations.dart';
import '../providers/page_controller_provider.dart';
import '../providers/selected_index_provider.dart';

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
      },
      selectedIndex: selectedIndex,
      destinations: menuDestinations.map((destination) {
        return NavigationDestination(
          selectedIcon: Icon(destination.selectedIcon),
          icon: Icon(destination.icon),
          label: destination.label,
        );
      }).toList(),
    );
  }
}
