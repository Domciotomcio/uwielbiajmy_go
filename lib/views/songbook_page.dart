import 'package:flutter/material.dart';
import '../providers/title_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SongbookPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      ref.read(titleProvider.notifier).state = 'Śpiewnik';
    });

    return Container(
      color: Colors.blue,
      child: Center(
        child: Text('This is the Songbook Page'),
      ),
    );
  }
}
