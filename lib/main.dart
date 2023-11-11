import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers/page_controller_provider.dart';
import 'providers/pages_provider.dart';
import 'providers/selected_index_provider.dart';
import 'providers/title_provider.dart';
import 'views/jam_page.dart';
import 'widgets/custom_navigation_bar.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedIndexProvider);
    final pageController = ref.watch(pageControllerProvider);
    final pages = ref.watch(pagesProvider);
    final title = ref.watch(titleProvider);

    ref.listen<int>(selectedIndexProvider, (previous, next) {
      pageController.animateToPage(
        next,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: PageView(
          controller: pageController,
          children: pages,
        ),
        bottomNavigationBar: CustomNavigationBar(),
      ),
    );
  }
}
