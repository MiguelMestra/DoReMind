import 'package:do_re_mind/Views/modules_view.dart';
import 'package:do_re_mind/Views/practice_duration_view.dart';
import 'package:do_re_mind/Views/teoric_duration_view.dart';
import 'package:flutter/material.dart';

class EducationDurationView extends StatelessWidget {
  const EducationDurationView({super.key});
  static String id = 'education_duration_view';

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
      body: SingleChildScrollView(
        child: Center(
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
              child: Image.asset('assets/duracion_colores.jpg'),
              onTap: () => {
                {Navigator.pushNamed(context, TeoricDurationView.id)}
              },
            ),
          ),
          const Text('Practico', style: TextStyle(fontSize: 30)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              child: Image.asset('assets/clase_musica.jpg'),
              onTap: () => {
                {Navigator.pushNamed(context, PracticeDurationView.id)}
              },
            ),
          )
        ])),
      ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {Navigator.pushNamed(context, ModulesView.id)},
        child: const Icon(Icons.arrow_back_outlined),
      ),
    );
  }
}
