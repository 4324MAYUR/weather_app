import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_project/routes/app_routes.dart';
import 'package:weather_project/screen/home/provider/weather_provider.dart';

void main()
{
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => WeatherProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
         routes: AllRoutes.appRoutes,
      ),
    );
  }
}
