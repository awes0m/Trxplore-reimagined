import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trxplore_com_ui_reimag/pages/welcome_page.dart';

import 'app_cubit.dart';
import 'app_cubit_states.dart';

class AppCubitLogics extends StatefulWidget {
  AppCubitLogics({Key? key}) : super(key: key);

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<AppCubit, CubitStates>(
      builder: (context, state) {
        if (state is WelcomeCubitState) {
          return WelcomePage();
        }
        else {
          return Container();
        }
      },
    ));
  }
}
