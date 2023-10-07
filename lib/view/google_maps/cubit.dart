import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/models/waether.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'states.dart';

class GoogleMapsCubit extends Cubit<GoogleMapsStates> {
  GoogleMapsCubit() : super(GoogleMapsInit());

  Set<Marker> markers = {};

  Weather? weather;

  Future<void> getWeather() async {
    if (markers.isEmpty) {
      return;
    }
    final position = markers.first.position;
    emit(GoogleMapsLoading());
    // const axios=("axios");
    // final options={
    // method: 'GET',
    // url: 'https://forecast9.p.rapidapi.com/',
    // headers: {
    // 'X-RapidAPI-Key': 'a79f77e2eamshff4a1ea001bee95p127babjsne8e9b1ef5361',
    // 'X-RapidAPI-Host': 'forecast9.p.rapidapi.com'
    // }
    try {
      // final response=await axios.request(options);

      final baseURL='http://api.weatherapi.com/v1/current.json';
      final params='?q=${position.latitude}, ${position.longitude}';
      final apiKey='&key=d0ebe8c2c6544e9a9be172025231009';
      final response =await Dio().get(baseURL+params+apiKey);
      weather=Weather.fromJson(response.data);
    } catch (e) {
      print(e);
    }
    emit(GoogleMapsInit());
  }
  void selectMarker(LatLng value){
    markers.add( Marker(
      markerId: const MarkerId('selected_location'),
      position: value,
    ));
    emit(GoogleMapsInit());
  }
  void reset(){
    markers.clear();
    weather=null;
    emit(GoogleMapsInit());
  }
}
