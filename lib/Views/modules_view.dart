import 'package:do_re_mind/Views/education_duration_view.dart';
import 'package:do_re_mind/Views/education_intensity_view.dart';
import 'package:do_re_mind/Views/login_view.dart';
import 'package:flutter/material.dart';

class ModulesView extends StatelessWidget {
  const ModulesView({super.key});
  static String id = 'modules_view';

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
            'Altura de las notas',
            style: TextStyle(fontSize: 30),
          ),
          GestureDetector(
            child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCva2R5xvXgo3-8jMqAJsR4wkhSqXahnTHGw&s'),
            onTap: () => {
              {Navigator.pushNamed(context, EducationIntensityView.id)}
            },
          ),
          const Text('Duración de las notas', style: TextStyle(fontSize: 30)),
          GestureDetector(
            child: Image.asset('assets/figuras_musicales.png'),
            onTap: () => {
              {Navigator.pushNamed(context, EducationDurationView.id)}
            },
          )
        ])),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {Navigator.pushNamed(context, LoginView.id)},
        child: const Icon(Icons.arrow_back_outlined),
      ),
    );
  }
}
