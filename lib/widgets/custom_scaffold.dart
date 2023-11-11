import 'package:flutter/material.dart';
import 'package:uwielbiajmy_go/widgets/custom_navigation_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/page_controller_provider.dart';
import '../providers/pages_provider.dart';

class Home extends ConsumerWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final pageController = ref.watch(pageControllerProvider);
    //final pages = ref.watch(pagesProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("title"),
      ),
      // body: PageView(
      //   controller: pageController,
      //   children: pages,
      // ),
      body: Container(
        child: Text("body"),
      ),
      //bottomNavigationBar: CustomNavigationBar(),
    );
  }
}
