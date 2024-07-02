import 'package:do_re_mind/Utils/auth.dart';
import 'package:do_re_mind/Views/modules_view.dart';
import 'package:do_re_mind/Views/registration_view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  static String id = 'login_view';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
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
                  style: const TextStyle(color: Colors.white)
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
                  String password = emailController.text;
                  var result = await _auth.singInEmailAndPassword(email, password);
                  if (result ==1 ){
                    print('Usuario no existente');
                  }else if (result ==2){
                    print('Contraseña equivocada');
                  }else if (result!=null){
                    Navigator.pushNamed(context, ModulesView.id);
                  }},
                child: const Text('Iniciar Sesion')),

            SizedBox(height: size.height*0.05,),
            GestureDetector(
              child: const Text("¿Aun no estas registrado?\nHazlo aquí",
            style: TextStyle(color: Color.fromARGB(255, 230, 226, 174), fontSize: 15, decoration: TextDecoration.underline, decorationColor:  Color.fromARGB(255, 230, 226, 174), decorationThickness: 1),
            textAlign: TextAlign.center,),
              onTap: () => {Navigator.pushNamed(context, RegistrationView.id)},
            )
          ],
        ),
      ),
    );
  }
}
