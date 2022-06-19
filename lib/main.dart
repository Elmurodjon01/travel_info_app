import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/NavigatorPages/mainPage.dart';
import 'package:flutter_cubit/cubit/appCubitLogics.dart';
import 'package:flutter_cubit/cubit/appCubits.dart';
import 'package:flutter_cubit/cubit/app_states.dart';
import 'package:flutter_cubit/pages/detailedPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<AppCubits>(
        create: (context)=> AppCubits(InitialState),
        child: AppLogics(),
      )
    );
  }
}
