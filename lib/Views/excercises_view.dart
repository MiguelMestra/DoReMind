import 'package:do_re_mind/Views/modules_view.dart';
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
          GestureDetector(
            child: Image.network(
                'https://www.safecreative.org/blog/es/wp-content/uploads/2022/09/partitura-para-escribir-una-cancion.jpg'),
            onTap: () => {
              {Navigator.pushNamed(context, ModulesView.id)}
            },
          ),
          const Text('Practico', style: TextStyle(fontSize: 30)),
          GestureDetector(
            child: Image.network(
                'https://previews.123rf.com/images/yummybuum/yummybuum2011/yummybuum201100167/159142867-aprendizaje-de-la-clase-de-m%C3%BAsica-los-j%C3%B3venes-estudiantes-escuchan-al-maestro-hombre-feliz-con.jpg'),
            onTap: () => {
              {Navigator.pushNamed(context, ModulesView.id)}
            },
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
