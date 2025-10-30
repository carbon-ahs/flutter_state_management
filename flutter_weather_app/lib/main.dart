import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/data/data_provider/weather_data_provider.dart';
import 'bloc/weather_bloc.dart';
import 'data/repository/weather_repository.dart';
import 'presentation/screens/weather_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => WeatherRepository(WeatherDataProvider()),
      child: BlocProvider(
        create: (context) => WeatherBloc(context.read<WeatherRepository>()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(useMaterial3: true),
          // home: const Scaffold(body: Center(child: Text('Hello World!'))),
          home: const WeatherScreen(),
        ),
      ),
    );
  }
}
