import 'package:do_re_mind/Views/modules_view.dart';
import 'package:do_re_mind/Views/teoric_duration_view.dart';
import 'package:do_re_mind/Views/teoric_tone_view.dart';
import 'package:flutter/material.dart';

class ExcercisesView extends StatelessWidget {
  const ExcercisesView({super.key});
  static String id = 'exercises_view';

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
              child: Image.asset('assets/clase_musica.jpg'),
              onTap: () => {
                {Navigator.pushNamed(context, TeoricDurationView.id)}
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
