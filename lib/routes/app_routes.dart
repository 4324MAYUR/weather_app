import 'package:flutter/cupertino.dart';
import 'package:weather_project/screen/home/page/homepage.dart';
import 'package:weather_project/screen/search/page/search_page.dart';

class AllRoutes
{
  static const String home = "/";
  static const String search = "search";

  static Map<String, Widget Function(BuildContext)> appRoutes =
  {
    "/" : (context) =>   const Homepage(),
    "search" : (context) => const SearchPage(),

  };

}