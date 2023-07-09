import 'package:flutter/material.dart';
import 'package:trendy_movies_app/routes/routes_name.dart';
import 'package:trendy_movies_app/screens/home.dart';
import 'package:trendy_movies_app/screens/movie_details.dart';

class Routes{

  static MaterialPageRoute generateRoute(RouteSettings settings){

    switch(settings.name){

      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context) => const Home(),settings: settings);

      case RoutesName.details:
        return MaterialPageRoute(builder: (BuildContext context) => const MovieDetails(),settings: settings);

      default:
        return MaterialPageRoute(builder: (BuildContext context) => const Home(),settings: settings);
    }
  }
}