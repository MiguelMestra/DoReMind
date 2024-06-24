import 'package:do_re_mind/Views/excercises_view.dart';
import 'package:do_re_mind/Views/login_view.dart';
import 'package:do_re_mind/Views/modules_view.dart';
import 'package:do_re_mind/Views/teoric_duration_view.dart';
import 'package:do_re_mind/Views/teoric_tone_view.dart';
import 'package:flutter/material.dart';

var customRoutes = <String, WidgetBuilder>{
  LoginView.id: (_) => const LoginView(),
  ModulesView.id: (_) => const ModulesView(),
  ExcercisesView.id: (_) => const ExcercisesView(),
  TeoricToneView.id: (_) => const TeoricToneView(),
  TeoricDurationView.id: (_) => const TeoricDurationView()
};
