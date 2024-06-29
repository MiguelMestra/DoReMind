import 'package:do_re_mind/Views/modules_view.dart';
import 'package:do_re_mind/Views/practice_intensity_view.dart';
import 'package:do_re_mind/Views/teoric_tone_view.dart';
import 'package:flutter/material.dart';

class EducationIntensityView extends StatelessWidget {
  const EducationIntensityView({super.key});
  static String id = 'education_intensity_view';

  @override
  Widget build(BuildContext context) {
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
      body: Center(
        child: (Column(children: [
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Teorico',
            style: TextStyle(fontSize: 30),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              child: Image.asset('assets/lapiz_partitura.jpg'),
              onTap: () => {
                {Navigator.pushNamed(context, TeoricToneView.id)}
              },
            ),
          ),
          const Text('Practico', style: TextStyle(fontSize: 30)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              child: Image.asset('assets/pentagrama_practica.jpg'),
              onTap: () => {
                {Navigator.pushNamed(context, PracticeIntensityView.id)}
              },
            ),
          )
        ])),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {Navigator.pushNamed(context, ModulesView.id)},
        child: const Icon(Icons.arrow_back_outlined),
      ),
    );
  }
}
