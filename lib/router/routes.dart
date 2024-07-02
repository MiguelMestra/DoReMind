import 'package:do_re_mind/Views/education_duration_view.dart';
import 'package:do_re_mind/Views/education_intensity_view.dart';
import 'package:do_re_mind/Views/login_view.dart';
import 'package:do_re_mind/Views/modules_view.dart';
import 'package:do_re_mind/Views/practice_duration_view.dart';
import 'package:do_re_mind/Views/practice_intensity_view.dart';
import 'package:do_re_mind/Views/registration_view.dart';
import 'package:do_re_mind/Views/teoric_duration_view.dart';
import 'package:do_re_mind/Views/teoric_tone_view.dart';
import 'package:flutter/material.dart';

var customRoutes = <String, WidgetBuilder>{
  LoginView.id: (_) => const LoginView(),
  ModulesView.id: (_) => const ModulesView(),
  EducationIntensityView.id: (_) => const EducationIntensityView(),
  EducationDurationView.id: (_) => const EducationDurationView(),
  TeoricToneView.id: (_) => const TeoricToneView(),
  TeoricDurationView.id: (_) => const TeoricDurationView(),
  PracticeIntensityView.id: (_) => const PracticeIntensityView(),
  PracticeDurationView.id: (_) => const PracticeDurationView(),
  RegistrationView.id: (_) => const RegistrationView(),
};
