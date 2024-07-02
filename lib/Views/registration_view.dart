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
                          color: Colors.white, fontWeight: FontWeight.w700)),
                  onChanged: (value) {},
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
                  controller: passwordController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: 'password',
                      labelStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w700)),
                  onChanged: (value) {},
                ),
              ),
            ),
            ElevatedButton(
                onPressed: ()async {
                  String email = emailController.text;
                  String password = emailController.text;
                  var result = await _auth.createAccount(email, password);
                  if (result ==1 ){
                    print('Password demasiado debil');
                  }else if (result ==2){
                    print('Email ya esta en uso');
                  }else if (result!=null){
                    Navigator.pushNamed(context, LoginView.id);
                  }

                  
                },
                child: const Text('Registrar'))
          ],
        ),
      ),
    );
  }
}
