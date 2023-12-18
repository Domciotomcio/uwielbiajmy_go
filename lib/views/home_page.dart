import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uwielbiajmy_go/providers/title_provider.dart';

import '../constants/destinations.dart';
import '../providers/page_controller_provider.dart';
import '../providers/pages_provider.dart';
import '../providers/selected_index_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var pageController = ref.read(pageControllerProvider);

    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 4 / 5.2, // Adjust the aspect ratio as needed
            crossAxisSpacing: 10, // Space between columns
            mainAxisSpacing: 10, // Space between rows
          ),
          itemCount: menuDestinations.skip(1).length,
          itemBuilder: (context, index) {
            var destination = menuDestinations.skip(1).elementAt(index);
            return HomeMyCard(
              title: destination.label,
              image: AssetImage(destination.imagePath),
              index: menuDestinations.indexOf(destination),
            );
          },
        ));
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
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        splashColor: Theme.of(context).colorScheme.secondary.withAlpha(30),
        onTap: () {
          ref.read(selectedIndexProvider.notifier).state = index;
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image(
                image: image,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(title, textAlign: TextAlign.left),
            ),
          ],
        ),
      ),
    );
  }
}
