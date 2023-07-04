
import 'package:diorequest/features/pages/add_page/add_page.dart';
import 'package:diorequest/features/pages/add_page/data/bloc/add_bloc.dart';
import 'package:diorequest/features/pages/edite_page/bloc/edite_bloc.dart';
import 'package:diorequest/features/pages/home_page/data/bloc/home_bloc.dart';
import 'package:diorequest/features/pages/home_page/hom_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AddBloc>(
          create: (BuildContext context) => AddBloc(),
        ),
        BlocProvider<HomeBloc>(
          create: (BuildContext context) => HomeBloc(),
        ),
        BlocProvider<EditeBloc>(
          create: (BuildContext context) => EditeBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}

