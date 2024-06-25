import 'package:do_re_mind/Views/education_intensity_view.dart';
import 'package:do_re_mind/Views/modules_view.dart';
import 'package:do_re_mind/Views/teoric_duration_view.dart';
import 'package:do_re_mind/Views/teoric_tone_view.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/scheduler.dart';

class PracticeIntensityView extends StatefulWidget {
  const PracticeIntensityView({super.key});
  static String id = 'practice_intensity_view';

  @override
  State<PracticeIntensityView> createState() => _PracticeIntensityViewState();
}

class _PracticeIntensityViewState extends State<PracticeIntensityView> {
  int visibleDots = 5;
  List<int> positions = [];
  DateTime startTime = DateTime.now();
  double seconds = 0;
  bool initDialogShown = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!initDialogShown) {
        showInitDialog();
      }
    });
  }

  void timeInitialize() {
    startTime = DateTime.now();
  }

  void calculateSeconds() {
    seconds = DateTime.now().difference(startTime).inMilliseconds / 1000;
  }

  void generatePoints() {
    Random random = Random();
    for (int i = 0; i < 5; i++) {
      int randomNumber = random.nextInt(100);
      if (randomNumber % 2 == 0) {
        positions.add(4);
      } else {
        positions.add(5);
      }
    }
  }

  void checkIsCorrect(int line) {
    if (positions[5 - visibleDots] == line) {
      removeDot();
    }
  }

  void removeDot() {
    setState(() {
      if (visibleDots > 0) {
        visibleDots--;
      }

      if (visibleDots == 0) {
        calculateSeconds();
        showWinDialog(seconds.toString());
      }
    });
  }

  void showInitDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Column(
            children: [
              const Text(
                'Debes elegir las notas correctas lo más rápido posible.\n\n',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
              const Text(
                'Pulsa OK para empezar.\n',
                textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                child: const Text('OK', style: TextStyle(fontSize: 15),),
                onPressed: () {
                  timeInitialize();
                  Navigator.of(context).pop();
                  setState(() {
                    initDialogShown = true;
                  });
                  generatePoints(); // Generar puntos después de cerrar el initDialog
                },
              ),
            ],
          ),
          )
          
        );
      },
    );
  }

  void showWinDialog(String tiempo) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Felicidades, has completado el nivel en: ',
            textAlign: TextAlign.center,
          ),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Text(tiempo, style: const TextStyle(fontSize: 40)),
                const Text("segundos", style: TextStyle(fontSize: 17)),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Reintentar'),
              onPressed: () {
                reset();
                Navigator.of(context).pop();
                showInitDialog();
              },
            ),
            ElevatedButton(
              child: const Text('Volver'),
              onPressed: () {
                Navigator.pushNamed(context, EducationIntensityView.id);
              },
            )
          ],
        );
      },
    );
  }

  void reset() {
    setState(() {
      positions = [];
    });

    visibleDots = 5;
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
                SizedBox(height: size.height * 0.1),
                CustomPaint(
                  size: Size(size.width * 0.8, size.width * 0.5),
                  painter: PentagramaPainter(visibleDots, positions),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        checkIsCorrect(5);
                      },
                      child: const Text(
                        'MI',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        checkIsCorrect(4);
                      },
                      child: const Text(
                        'SOL',
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
    );
  }
}

class PentagramaPainter extends CustomPainter {
  final int visibleDots;
  final List<int> positions;

  PentagramaPainter(this.visibleDots, this.positions);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2.0;

    final double lineSpacing = size.height / 6; // Espacio entre líneas

    // Dibujar las 5 líneas del pentagrama
    for (int i = 1; i <= 5; i++) {
      double y = i * lineSpacing;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }

    // Dibujar los óvalos (notas)
    final double ovalWidth = size.width * 0.05;
    final double ovalHeight = size.width * 0.03;

    for (int i = 0; i < visibleDots; i++) {
      double ovalX = size.width / 6 * (5 - i); // Posiciones X distribuidas uniformemente
      double ovalY =
          lineSpacing * positions[5 - i - 1]; // Poner todas las notas en la segunda línea

      Rect ovalRect =
          Rect.fromLTWH(ovalX, ovalY - (ovalHeight / 2), ovalWidth, ovalHeight);
      canvas.drawOval(ovalRect, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}