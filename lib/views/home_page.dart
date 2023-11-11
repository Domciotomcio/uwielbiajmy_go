import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uwielbiajmy_go/providers/title_provider.dart';

import '../providers/page_controller_provider.dart';
import '../providers/pages_provider.dart';
import '../providers/selected_index_provider.dart';

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      ref.read(titleProvider.notifier).state = 'Strona Główna';
    });

    var pageController = ref.read(pageControllerProvider);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Uwiebiajmy Go!',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            HomeCard(
                image: AssetImage('assets/images/ukulele.jpg'),
                title: 'Songbook',
                index: 1),
            SizedBox(height: 20),
            HomeCard(
                image: AssetImage('assets/images/ukulele.jpg'),
                title: 'Jam',
                index: 2),
            HomeCard(
                image: AssetImage('assets/images/ukulele.jpg'),
                title: 'Jam',
                index: 2),
          ],
        ),
      ),
    );
  }
}

class HomeCard extends ConsumerWidget {
  const HomeCard({
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
      child: InkWell(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                Container(
                  height: constraints.maxWidth * 0.5, // 80% of parent width
                  width: constraints.maxWidth,
                  padding: EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(
                      image: AssetImage('assets/images/ukulele.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(title),
                ),
              ],
            );
          },
        ),
        onTap: () {
          ref.read(selectedIndexProvider.notifier).state = index;
        },
      ),
    );
  }
}
