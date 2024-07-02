import 'package:do_re_mind/firebase_options.dart';
import 'package:do_re_mind/router/routes.dart';
import 'package:do_re_mind/views/login_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([ DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: 'DoReMind',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
          useMaterial3: true),
      initialRoute: LoginView.id,
      routes: customRoutes,
    );
  }
}
