import 'package:do_re_mind/Views/excercises_view.dart';
import 'package:do_re_mind/Views/modules_view.dart';
import 'package:flutter/material.dart';

class TeoricDurationView extends StatelessWidget {
  const TeoricDurationView({super.key});
  static String id = 'teoric_duration_view';

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
              'El Pulso y La Negra',
              style: TextStyle(fontSize: 30),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.06,
              ),
            child: const Text('Cuando hablamos de medir duraciones, los musicos no medimos en segundos o en minutos, medimos en cantidad de pulsos. '
            'pero, ¿qué es un pulso?. \n'
            'Si pensamos en el cuerpo humano, el pulso cardiaco hace referencia a los latidos que hace el corazon en un tiempo determinado, '
            'los latidos cumplen con la caracteristica de ser constantes en el tiempo, es decir, siempre se diferencian la misma cantidad de tiempo entre si. '
            'De igual forma el pulso en la musica es un "latido", no importa cuan larga sea la diferencia entre pulsos, puede ser cada 2 segundos, o cada 3 segundos, lo unico '
            'que importa es que entre cada pulso el tiempo siempre sea el mismo.\n\n',
            style: TextStyle(fontSize: 17),),
          ),
          const SizedBox(height: 10),
          Image.asset('assets/negra.png'),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.06,
              ),
            child: const Text('La negra es una figura que se representa con una cabeza de nota ovalada coloreada en negro y con una barra vertical sin importar si es hacia abajo o hacia arriba, esta figura me indicia que el '
            'sonido tiene una duración equivalente a 1 intervalo entre 2 pulsos, es decir, que el sonido de negra, es un sonido que se empieza al tocar un pulso y termina cuando empieza el siguiente.\n'
            ,
            style: TextStyle(fontSize: 17),),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.06,
              ),
            child: const Text('Asi como tenemos una notacion para cuando suena un sonido desde que empieza un pulso hasta el siguiente, tambien los musicos tenemos un simbolo para hacer silencio un tiempo determinado, '
            'en el caso del silencio que tiene la misma duración que la negra, se le conoce como silencio de negra',
            style: TextStyle(fontSize: 17),),
          ),
          Image.asset('assets/silencio_negra.png')
          ,
        ],),
    ) ,
      ) 
      ,
      floatingActionButton: FloatingActionButton(
        onPressed: () => {Navigator.pushNamed(context, ExcercisesView.id)},
        child: const Icon(Icons.arrow_back_outlined),
    ),
    );
  }
}