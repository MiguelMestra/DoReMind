import 'package:do_re_mind/Views/education_duration_view.dart';
import 'package:do_re_mind/Views/education_intensity_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import 'package:soundpool/soundpool.dart';

class PracticeDurationView extends StatefulWidget {
  const PracticeDurationView({super.key});
  static String id = 'practice_duration_view';

  @override
  State<PracticeDurationView> createState() => _PracticeDurationViewState();
}

class _PracticeDurationViewState extends State<PracticeDurationView> {
  // ignore: deprecated_member_use
  Soundpool pool = Soundpool(streamType: StreamType.notification);
  List<String> sounds = [];
  List<int> soundIds = [];
  List<Widget> images = [];
  List<int> correctNotes = [];
  int actualPosition = 0;
  int failedAttemps = 0;
  int correctAttemps = 0;
  bool soundsLoaded = false;

  @override
  void initState() {
    super.initState();
    loadSounds().then((_) {
      setState(() {
        soundsLoaded = true;
      });
      reset();
    });
  }

  void initImages() {
    images = [];
    for (int i = 0; i < 4; i++) {
      images.add(Container(
        width: 120,
        height: 200,
        color: Colors.white,
      ));
    }
  }

  Future<void> loadSounds() async {
    soundIds.add(await rootBundle.load('sounds/pulso.mp3').then((ByteData soundData) {
      return pool.load(soundData);
    }));
    soundIds.add(await rootBundle.load('sounds/negra.mp3').then((ByteData soundData) {
      return pool.load(soundData);
    }));
  }

  void playSounds() async {
    if (!soundsLoaded) return;
    for (int i = 0; i < sounds.length; i++) {
      int soundIndex = sounds[i] == 'sounds/pulso.mp3' ? 0 : 1;
      pool.play(soundIds[soundIndex]);
      await Future.delayed(const Duration(milliseconds: 755));
    }
  }

  void generateSounds() {
    Random random = Random();
    sounds = [];
    correctNotes = [];
    for (int i = 0; i < 4; i++) {
      int randomNumber = random.nextInt(100);
      if (randomNumber % 2 == 0) {
        sounds.add('sounds/pulso.mp3');
        correctNotes.add(0);
      } else {
        sounds.add('sounds/negra.mp3');
        correctNotes.add(1);
      }
    }
  }

  void checkIsCorrect(int note) {
    if (correctNotes[actualPosition] == note) {
      setState(() {
        if (note == 0) {
          images[actualPosition] = Image.asset("assets/silencio_icon.png");
        } else {
          images[actualPosition] = Image.asset("assets/negra_icon.png");
        }
        actualPosition++;
        correctAttemps++;
      });
    } else {
      failedAttemps++;
    }
  }

  void checkWin() {
    if (correctAttemps == 4) {
      double percentage = (correctAttemps) / (failedAttemps + correctAttemps) * 100;
      setState(() {
        showWinDialog(percentage.toStringAsFixed(2));
      });
    }
  }

  void showWinDialog(String percentage) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Felicidades, has completado el nivel!\n'
            'Tu porcentaje de acierto es: ',
            textAlign: TextAlign.center,
          ),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Text('$percentage %', style: const TextStyle(fontSize: 40)),
                const Text("", style: TextStyle(fontSize: 17)),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Reintentar'),
              onPressed: () {
                reset();
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text('Volver'),
              onPressed: () {
                Navigator.pushNamed(context, EducationDurationView.id);
              },
            )
          ],
        );
      },
    );
  }

  void reset() {
    setState(() {
      actualPosition = 0;
      failedAttemps = 0;
      correctAttemps = 0;
      generateSounds();
      initImages();
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Do-ReMind',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.purple,
        ),
        body: Column(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: size.height * 0.03),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.06,
                    ),
                    child: const Text(
                      'Presiona en el boton para escuchar la pista y luego escribe la partitura presionando el simbolo correspondiente',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  
                SizedBox(height: size.height * 0.04),
                Container(
                  padding: const EdgeInsets.only(bottom: 100, top: 5),
                  child: IconButton(
                    icon: const Icon(Icons.play_arrow),
                    iconSize: 50,
                    onPressed: () {
                      playSounds();
                    },
                  ),
                ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.black, width: 2),
                          ),
                        ),
                        child: images[0],
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.black, width: 2),
                          ),
                        ),
                        child: images[1],
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.black, width: 2),
                          ),
                        ),
                        child: images[2],
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.black, width: 2),
                          ),
                        ),
                        child: images[3],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          checkIsCorrect(1);
                          checkWin();
                        },
                        child: const Text(
                          'NEGRA',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          checkIsCorrect(0);
                          checkWin();
                        },
                        child: const Text(
                          'SILENCIO',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () =>
              {Navigator.pushNamed(context, EducationDurationView.id)},
          child: const Icon(Icons.arrow_back_outlined),
        ));
  }
}