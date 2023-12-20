import 'package:uwielbiajmy_go/models/song.dart';

import 'songs_service.dart';

class SongsServiceMock implements SongsService {
  @override
  Future<List<Song>> getSongs() async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      const Song(
          id: '',
          title: "Another in the fire",
          key: "C",
          artist: "Hillsong",
          language: "english",
          tempo: "medium",
          bpm: "68",
          songbookNumber: "1",
          sections: [
            "Intro",
            "Verse 1",
            "Chorus 1",
            "Tag 1",
            "Verse 2",
            "Chorus 2",
            "Bridge 1",
            "Verse 3",
            "Chorus 3",
          ],
          lyrics: {
            "Verse 1": [
              "There's a grace when the heart is under fire",
              "Another way when the walls are closing in",
              "And when I look at the space between",
              "Where I used to be and this reckoning",
              "I know I will never be alone",
            ],
            "Chorus 1": [
              "There was another in the fire standing next to me",
              "There was another in the waters holding back the seas",
              "And should I ever need reminding",
              "How I've been set free",
              "There is a cross that bears the burden",
              "Where another died for me",
              "There is another in the fire",
            ],
            "Tag 1": [
              "All my debt left for dead beneath the waters",
              "I'm no longer a slave to my sin anymore",
              "And should I fall in the space between",
              "What remains of me and this reckoning",
              "Either way I won't bow",
              "To the things of this world",
              "And I know I will never be alone",
            ],
            "Verse 2": [
              "There is another in the fire",
              "Standing next to me",
              "There is another in the waters",
              "Holding back the seas",
              "And should I ever need reminding",
              "How good You've been to me",
              "I'll count the joy come every battle",
              "'Cause I know that's where You'll be",
            ],
            "Chorus 2": [
              "I can see the light in the darkness",
              "As the darkness bows to Him",
              "I can hear the roar in the heavens",
              "As the space between wears thin",
              "I can feel the ground shake beneath us",
              "As the prison walls cave in",
              "Nothing stands between us",
              "Nothing stands between us",
            ],
            "Bridge 1": [
              "There is no other name",
              "But the Name that is Jesus",
              "He who was and still is",
              "And will be through it all",
              "So come what may in the space between",
              "All the things unseen and this reckoning",
              "I know I will never be alone",
            ],
            "Verse 3": [
              "There'll be another in the fire, Standing next to me",
              "There'll be another in the waters",
              "Holding back the seas",
              "And should I ever need reminding",
              "How good You've been to me",
              "I'll count the joy come every battle",
              "'Cause I know that's where You'll be",
              "I'll count the joy come every battle",
              "'Cause I know that's where You'll be",
            ],
            "Chorus 3": [
              "I can see the light in the darkness",
              "As the darkness bows to Him",
              "I can hear the roar in the heavens",
              "As the space between wears thin",
              "I can feel the ground shake beneath us",
              "As the prison walls cave in",
              "Nothing stands between us",
              "Nothing stands between",
            ],
          },
          chords: {
            "Intro": ["Am F6 C", "Am F6 C"],
            "Verse 1": ["Am F6 C", "Am F6 C", "Am F6", "C G/C", "Am F6 C"],
            "Chorus 1": [
              "Am F6 C",
              "Am F6 C",
              "Am",
              "F C",
              "A",
              "F6 C",
              "Am F6 C"
            ],
          }),
      const Song(
          id: '',
          title: "Jezus jest Panem",
          key: "C",
          language: "polish",
          tempo: "medium",
          bpm: "68",
          sections: [
            "Intro",
            "Verse 1",
            "Chorus 1",
            "Tag 1",
            "Verse 2",
            "Chorus 2",
            "Bridge 1",
            "Verse 3",
            "Chorus 3",
          ],
          lyrics: {
            "Verse 1": [
              "There's a grace when the heart is under fire",
              "Another way when the walls are closing in",
              "And when I look at the space between",
              "Where I used to be and this reckoning",
              "I know I will never be alone",
            ],
            "Chorus 1": [
              "There was another in the fire standing next to me",
              "There was another in the waters holding back the seas",
              "And should I ever need reminding",
              "How I've been set free",
              "There is a cross that bears the burden",
              "Where another died for me",
              "There is another in the fire",
            ],
            "Tag 1": [
              "All my debt left for dead beneath the waters",
              "I'm no longer a slave to my sin anymore",
              "And should I fall in the space between",
              "What remains of me and this reckoning",
              "Either way I won't bow",
              "To the things of this world",
              "And I know I will never be alone",
            ],
            "Verse 2": [
              "There is another in the fire",
              "Standing next to me",
              "There is another in the waters",
              "Holding back the seas",
              "And should I ever need reminding",
              "How good You've been to me",
              "I'll count the joy come every battle",
              "'Cause I know that's where You'll be",
            ],
            "Chorus 2": [
              "I can see the light in the darkness",
              "As the darkness bows to Him",
              "I can hear the roar in the heavens",
              "As the space between wears thin",
              "I can feel the ground shake beneath us",
              "As the prison walls cave in",
              "Nothing stands between us",
              "Nothing stands between us",
            ],
          },
          chords: {
            "Intro": ["Am F6 C", "Am F6 C"],
            "Verse 1": ["Am F6 C", "Am F6 C", "Am F6", "C G/C", "Am F6 C"],
            "Chorus 1": [
              "Am F6 C",
              "Am F6 C",
              "Am",
              "F C",
              "A",
              "F6 C",
              "Am F6 C"
            ],
          }),
      const Song(
          id: '', title: 'Trzecia Pieśń', sections: [], lyrics: {}, chords: {}),
    ];
  }
  // Implement the methods from the SongsService interface here
}
