//this file should hold and check the states of cubit

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubit/appCubits.dart';
import 'package:flutter_cubit/cubit/app_states.dart';
import 'package:flutter_cubit/pages/initial_page.dart';

class AppLogics extends StatefulWidget {
  const AppLogics({Key? key}) : super(key: key);

  @override
  State<AppLogics> createState() => _AppLogicsState();
}

class _AppLogicsState extends State<AppLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is WelcomeState) {
            return IntroPage();
          } else {
            return Container(
              child: Text('Something is wrong'),
            );
          }
        },
      ),
    );
  }
}
