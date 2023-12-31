import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/location_utils.dart';
import 'package:weather_app/core/models/waether.dart';
part 'states.dart';

class HomeCubit extends Cubit<HomeStates>{
  HomeCubit():super(HomeInit());

  Weather? weather;

  Future<void>getCurrentWeather()async{
    final position =LocationUtils.currentPosition;
    if (position==null) {
      return;
    }
    emit(HomeLoading());
    try{
      final baseURL ='http://api.weatherapi.com/v1/current.json';
      final params='?q=${position.latitude}, ${position.longitude}';
      final apiKey='&key=d0ebe8c2c6544e9a9be172025231009';
      final response=await Dio().get(baseURL+params+apiKey);
      weather=Weather.fromJson(response.data);
    } catch(e){
      print(e);
    }
    emit(HomeInit());
  }
}