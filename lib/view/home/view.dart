import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/view/home/cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeCubit()..getCurrentWeather(),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<HomeCubit,HomeStates>(
          builder: (context,state){
            final cubit=BlocProvider.of<HomeCubit>(context);
            if (state is HomeLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final weather=cubit.weather;
            if (weather==null) {
              return const Center(
                child: Text('Something went wrong'),
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(weather.condition),
                Text(weather.district),
                Text(weather.region),
                Text(weather.country),
                Text(weather.temp.toString()),
                Text(weather.windSpeed.toString()),
                Text(weather.time),
                Text(weather.timezone),
              ],
            );
          },
        ),
      ),
    );
  }
}
