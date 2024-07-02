import 'package:do_re_mind/Utils/auth.dart';
import 'package:do_re_mind/views/login_view.dart';
import 'package:flutter/material.dart';

class RegistrationView extends StatefulWidget {
  const RegistrationView({super.key});
  static String id = 'registration_view';

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  final AuthService _auth = AuthService();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void showErrorDialog(String message) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.purple[100],
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          title: Text(
            'Error',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              color: Colors.purple[900],
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.purple[700],
                  ),
                ),
                SizedBox(
                    height: 20), // Añadir espacio entre el texto y el botón
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor:
                        Colors.purple[700], // Color del texto del botón
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'OK',
                    style: TextStyle(fontSize: 15),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    setState(() {
                      reset();
                    });
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void reset() {
    emailController.text = "";
    passwordController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Do-ReMind',
              style: TextStyle(
                fontSize: 50,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.1,
                vertical: size.height * 0.02,
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    border: Border.all(color: Colors.white)),
                child: TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: 'email',
                      labelStyle: TextStyle(
                          color: Colors.white60, fontWeight: FontWeight.w700)),
                  onChanged: (value) {},
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),

            // password
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * .1,
                  right: size.width * 0.1,
                  bottom: size.height * 0.03),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    border: Border.all(color: Colors.white)),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: 'password',
                      labelStyle: TextStyle(
                          color: Colors.white60, fontWeight: FontWeight.w700)),
                  onChanged: (value) {},
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  String email = emailController.text;
                  String password = passwordController.text;
                  var result = await _auth.createAccount(email, password);
                  if (result == 1) {
                    showErrorDialog("La contraseña es demasiado debil");
                  } else if (result == 2) {
                    showErrorDialog("El correo digitado ya está en uso");
                  } else if (result == 3) {
                    showErrorDialog("Email Invalido");
                  }  else if (result == 4) {
                    showErrorDialog("La contraseña no debe ser vacia");
                  }else if (result != null) {
                    Navigator.pushNamed(context, LoginView.id);
                  }
                },
                child: const Text('Registrar')),

            SizedBox(
              height: size.height * 0.05,
            ),
            GestureDetector(
              child: const Text(
                "Volver a Inicio de Sesión",
                style: TextStyle(
                  color: Color.fromARGB(255, 230, 226, 174),
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
              onTap: () => {Navigator.pushNamed(context, LoginView.id)},
            )
          ],
        ),
      ),
    );
  }
}
