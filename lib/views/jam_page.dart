import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../providers/title_provider.dart';

final activeChordsProvider = StateProvider<List<String>>((ref) => []);

class JamPage extends ConsumerWidget {
  const JamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      ref.read(titleProvider.notifier).state = 'Uiwelbiajmy Razem';
    });

    List<String> upChords = ['C#', 'D#', 'F#', 'G#', 'A#'];
    List<String> downChords = ['C', 'D', 'E', 'F', 'G', 'A', 'H'];

    var activeChords = ref.watch(activeChordsProvider);

    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: downChords
                  .map((note) => RoundedButton(
                        onPressed: () {
                          ref
                              .read(activeChordsProvider.notifier)
                              .state
                              .add(note);
                        },
                        onLongPress: () {
                          ref
                              .read(activeChordsProvider.notifier)
                              .state
                              .add(note + 'm');
                        },
                        text: note,
                      ))
                  .toList(),
            ),
            const SizedBox(height: 10),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: activeChords
                  .map((note) => Padding(
                        padding: const EdgeInsets.all(
                            8.0), // adjust the value as needed
                        child: Text(
                          note,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ))
                  .toList(),
            )),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        ref.read(activeChordsProvider.notifier).state.clear();
                      },
                      child: Text('Wyczyść')),
                ),
              ],
            ),
          ],
        ));
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
        //padding: EdgeInsets.all(20),
      ),
      child: Text(text),
      onLongPress: onLongPress,
    );
  }
}

class CircularLayout extends StatelessWidget {
  final int numberOfButtons = 8;

  final size = 300.0;

  @override
  Widget build(BuildContext context) {
    double radius = (min(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height) /
        2);

    radius = 250 / 2;

    return LayoutBuilder(
      builder: (context, constraints) => Container(
        color: Colors.grey,
        width: size,
        height: size,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              child: FloatingActionButton(
                onPressed: () {},
                child: Text('0'),
              ),
            ),
            ...List.generate(numberOfButtons, (index) {
              // Subtract the margin from the radius
              double angle = (360 / numberOfButtons) * index - 90;
              double x = cos(degToRad(angle)) * radius;
              double y = sin(degToRad(angle)) * radius;
              return Positioned(
                left: x + radius,
                top: y + radius,
                child: FloatingActionButton(
                  onPressed: () {},
                  child: Text('${index + 1}'),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  double degToRad(double deg) => deg * (pi / 180.0);
}
