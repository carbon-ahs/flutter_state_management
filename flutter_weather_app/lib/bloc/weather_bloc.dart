import 'package:bloc/bloc.dart';
import 'package:flutter_weather_app/data/repository/weather_repository.dart';
import 'package:meta/meta.dart';

import '../data/models/weather_model.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherBloc(this.weatherRepository) : super(WeatherInitial()) {
    on<WeatherFetched>(_onWeatherFetched);
  }

  Future<void> _onWeatherFetched(
    WeatherFetched event,
    Emitter<WeatherState> emit,
  ) async {
    emit(WeatherLoading());
    try {
      final weather = await weatherRepository.getCurrentWeatherModel();

      emit(WeatherSuccess(weather));
    } catch (e) {
      emit(WeatherFailure(e.toString()));
    }
  }
}
