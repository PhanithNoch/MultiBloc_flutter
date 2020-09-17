import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_bloc/bloc/counter_bloc.dart';
import 'package:multi_bloc/home_page.dart';
import 'package:multi_bloc/random/random_bloc.dart';

void main() {
  return runApp(
    MyApp()
  );


}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

        BlocProvider(
          create: (BuildContext context) => CounterBloc(),
        ),
        BlocProvider(
          create: (BuildContext context) => RandomBloc(),
        ),
      ],

      child: MaterialApp(
        home: HomeScreen(),
      ),
    );

  }
}

