// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:trendy_movies_app/models/movie_details.dart';
import 'package:trendy_movies_app/services/movie_list_service.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc() : super(MovieDetailsInitial()) {
    on<DetailsLoadEvent>((event, emit) async {
      MovieDetail? movieDetail = await MovieService().getMovieDetails(event.id);
      emit(MovieDetailsFetch(movieDetail));
    });
  }
}
