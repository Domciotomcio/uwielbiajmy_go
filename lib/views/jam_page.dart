import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../providers/title_provider.dart';

final activeChordsProvider = StateProvider<List<String>>((ref) => []);

final newActiveChordsProvider =
    StateNotifierProvider<ChordNotifier, List<String>>(
        (ref) => ChordNotifier());

class ChordNotifier extends StateNotifier<List<String>> {
  ChordNotifier() : super([]);

  void addChord(String chord) {
    state = [...state, chord];
  }

  void clearChords() {
    state = [];
  }
}

class JamPage extends ConsumerWidget {
  const JamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // WidgetsBinding.instance!.addPostFrameCallback((_) {
    //   ref.read(titleProvider.notifier).state = 'Uiwelbiajmy Razem';
    // });

    List<String> basicChords = ['C', 'D', 'E', 'F', 'G', 'A', 'H'];
    List<String> upChords = ['C#', 'D#', 'F#', 'G#', 'A#'];
    List<String> downChords = ['Cb', 'Db', 'Eb', 'Gb', 'Ab', 'B'];

    var activeChords = ref.watch(newActiveChordsProvider);

    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: basicChords
                        .map((note) => RoundedButton(
                              onPressed: () {
                                ref
                                    .read(newActiveChordsProvider.notifier)
                                    .addChord(note);
                              },
                              onLongPress: () {
                                ref
                                    .read(newActiveChordsProvider.notifier)
                                    .addChord(note + 'm');
                              },
                              text: note,
                            ))
                        .toList(),
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: activeChords
                        .map((note) => Padding(
                              padding: const EdgeInsets.all(
                                  8.0), // adjust the value as needed
                              child: Text(
                                note,
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                            ))
                        .toList(),
                  )),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: upChords
                        .map((note) => RoundedButton(
                              onPressed: () {
                                ref
                                    .read(newActiveChordsProvider.notifier)
                                    .addChord(note);
                              },
                              onLongPress: () {
                                ref
                                    .read(newActiveChordsProvider.notifier)
                                    .addChord(note + 'm');
                              },
                              text: note,
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ));
  }
}

class JamFloatingActionButton extends ConsumerWidget {
  const JamFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SpeedDial(
      icon: Icons.music_note,
      activeIcon: Icons.close,
      renderOverlay: false,
      curve: Curves.bounceIn,
      children: [
        SpeedDialChild(
          child: Text('#', style: TextStyle(fontSize: 24)),
          label: 'Zmień na molowe',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => print('THIRD CHILD'),
          onLongPress: () => print('THIRD CHILD LONG PRESS'),
        ),
        SpeedDialChild(
          child: Text('b',
              style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic)),
          label: 'Zmień na krzyżykowe',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => print('THIRD CHILD'),
          onLongPress: () => print('THIRD CHILD LONG PRESS'),
        ),
        SpeedDialChild(
          child: Icon(Icons.clear),
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          label: 'Wyczyść',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => ref.read(newActiveChordsProvider.notifier).clearChords(),
        ),
      ],
    );
  }
}

class RoundedButton extends StatelessWidget {
  const RoundedButton(
      {super.key,
      required this.onPressed,
      required this.onLongPress,
      required this.text});

  final VoidCallback onPressed;
  final VoidCallback onLongPress;
  final String text;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(20),
      ),
      child: Text(text),
      onLongPress: onLongPress,
    );
  }
}
