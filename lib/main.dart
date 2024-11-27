import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naviquezon/src/app.dart';
import 'package:naviquezon/src/core/firebase/firebase_options.dart';
import 'package:naviquezon/src/core/utils/loggers/bloc_logger.dart';

/// The entry point of the application.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    name: 'NaviQuezon',
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //  Initialize bloc observer
  Bloc.observer = const BlocLogger();

  //  Set the preferred orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const App());
}
