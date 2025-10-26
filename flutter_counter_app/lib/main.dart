import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter_app/bloc/counter_bloc.dart';
import 'package:flutter_counter_app/cubit/counter_cubit.dart';
import 'package:flutter_counter_app/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterCubit()),
        BlocProvider(create: (context) => CounterBloc()),
      ],
      child: MaterialApp(home: MyHomePage(title: "title")),
    );
  }
}
