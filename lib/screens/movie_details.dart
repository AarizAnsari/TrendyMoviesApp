import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trendy_movies_app/bloc/movie_details_bloc.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({Key? key}) : super(key: key);

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final args = ModalRoute.of(context)?.settings.arguments;
      context.read<MovieDetailsBloc>().add(DetailsLoadEvent(args as int));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
          builder: (context, state) {
            if (state.movieDetail != null) {
              return SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: (MediaQuery.of(context).size.width),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    'http://image.tmdb.org/t/p/w185/${state.movieDetail!.posterPath}'),
                                fit: BoxFit.contain)),
                      ),
                    ),
                    Center(
                      child: Text(
                        state.movieDetail!.originalTitle,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 24),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          state.movieDetail!.tagline,
                          style: const TextStyle(
                              color: Colors.white60, fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const Divider(height: 1, color: Colors.white),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Description',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 8),
                      child: Text(
                        state.movieDetail!.overview,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const Center(
                child: SizedBox(
                    height: 100,
                    width: 100,
                    child: CircularProgressIndicator()),
              );
            }
          },
        ));
  }
}
