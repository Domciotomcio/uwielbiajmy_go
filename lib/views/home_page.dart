import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uwielbiajmy_go/providers/title_provider.dart';

import '../constants/destinations.dart';
import '../providers/page_controller_provider.dart';
import '../providers/pages_provider.dart';
import '../providers/selected_index_provider.dart';

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var pageController = ref.read(pageControllerProvider);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
          // children: menuDestinations.skip(1).map((destination) {
          //   return HomeMyCard(
          //     title: destination.label,
          //     image: AssetImage(destination.imagePath),
          //     index: menuDestinations.indexOf(destination),
          //   );
          // }).toList(),
          children: [
            Expanded(
              child: ListView(
                children: menuDestinations.skip(1).map((destination) {
                  return HomeMyCard(
                    title: destination.label,
                    image: AssetImage(destination.imagePath),
                    index: menuDestinations.indexOf(destination),
                  );
                }).toList(),
              ),
            ),
          ]),
    );
  }
}

class HomeMyCard extends ConsumerWidget {
  const HomeMyCard({
    Key? key,
    required this.title,
    required this.image,
    required this.index,
  }) : super(key: key);

  final String title;
  final AssetImage image;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: Theme.of(context).colorScheme.secondary.withAlpha(30),
        onTap: () {
          ref.read(selectedIndexProvider.notifier).state = index;
        },
        child: Column(
          children: [
            Image(
              image: image,
              fit: BoxFit.cover,
            ),
            ListTile(
              title: Text(title),
            ),
          ],
        ),
      ),
    );
  }
}
