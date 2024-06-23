import 'package:do_re_mind/Views/excercises_view.dart';
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
          'Do-ReMind123',
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
              {Navigator.pushNamed(context, ExcercisesView.id)}
            },
          ),
          const Text('Duración de las notas', style: TextStyle(fontSize: 30)),
          GestureDetector(
            child: Image.network(
                'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjQuDVnT3AwklnpWUGqCRCOhqYA-cpArG0qe7ZuEqcgegz_w0-x26_y1L-HEPBxe8k-iCzP1Mw1uJ8__ZyR4Xua0AzAw721f1Y850yx6SBHdQxAvG8Ko9IJgM7YuRZGuM6Z11RJ-j-kTk4/w400-h173/figuras+musicales.png'),
            onTap: () => {
              {Navigator.pushNamed(context, ExcercisesView.id)}
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
