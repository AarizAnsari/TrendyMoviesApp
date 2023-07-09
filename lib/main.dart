import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trendy_movies_app/bloc/movie_details_bloc.dart';
import 'package:trendy_movies_app/bloc/movie_list_bloc.dart';
import 'package:trendy_movies_app/routes/routes.dart';
import 'package:trendy_movies_app/routes/routes_name.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => MovieListBloc(),
    child: BlocProvider(
      create: (context) => MovieDetailsBloc(),
      child: const MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RoutesName.home,
        onGenerateRoute: Routes.generateRoute);
  }
}
