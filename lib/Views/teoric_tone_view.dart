import 'package:do_re_mind/Views/education_intensity_view.dart';
import 'package:flutter/material.dart';

class TeoricToneView extends StatelessWidget {
  const TeoricToneView({super.key});
  static String id = 'teoric_tone_view';

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
      body: SingleChildScrollView(
        child:Center(
        child: Column(children: [
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              'La Clave de Sol',
              style: TextStyle(fontSize: 30),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.06,
              ),
            child: const Text('Al leer una partitura, lo primero que nos encontraremos siempre es ' 
            'con la clave musical, esta nos indica cual es la nota que corresponde a cada espacio y linea dentro del pentagrama musical. \n'
            'La Clave mas conocida y usada en el mundo de la musica, es la Clave de Sol ',
            style: TextStyle(fontSize: 17),),
          ),
          const SizedBox(height: 10),
          Image.asset('assets/clave_sol.png'),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.06,
              ),
            child: const Text('Por ahora no nos centraremos en todas las notas del pentagrama, solamente miraremos '
            'las primeras 2 lineas en clave de Sol.\n'
            'Todas las figuras colocadas sobre la primera linea del pentagrama, corresponderán a la nota MI, '
            'mientras que todas las figuras sobre la segunda linea, corresponderán a la nota SOL',
            style: TextStyle(fontSize: 17),),
          ),
          Image.asset('assets/notas_mi_sol.png'),
        ],),
    ) ,
      ) 
      ,
      floatingActionButton: FloatingActionButton(
        onPressed: () => {Navigator.pushNamed(context, EducationIntensityView.id)},
        child: const Icon(Icons.arrow_back_outlined),
    ),
    );
  }
}