import 'package:do_re_mind/Views/practice_intensity_view.dart';
import 'package:do_re_mind/router/routes.dart';
import 'package:do_re_mind/views/login_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
