import 'package:flutter/material.dart';

class JammingView extends StatefulWidget {
  const JammingView({super.key});

  @override
  State<JammingView> createState() => _JammingViewState();
}

class _JammingViewState extends State<JammingView> {
  List<String> activeChords = [];

  @override
  Widget build(BuildContext context) {
    List<String> upChords = ['C#', 'D#', 'F#', 'G#', 'A#'];
    List<String> downChords = ['C', 'D', 'E', 'F', 'G', 'A', 'H'];

    return Scaffold(
      appBar: AppBar(title: const Text('Jamowanie')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: upChords
                  .map((note) => RoundedButton(
                        onPressed: () {
                          setState(() {
                            activeChords.add(note);
                          });
                        },
                        text: note,
                      ))
                  .toList(),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: downChords
                  .map((note) => RoundedButton(
                      onPressed: () {
                        setState(() {
                          activeChords.add(note);
                        });
                      },
                      text: note))
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
                        setState(() {
                          activeChords.clear();
                        });
                      },
                      child: Text('Clear')),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  const RoundedButton({super.key, required this.onPressed, required this.text});

  final VoidCallback onPressed;
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
    );
  }
}
