// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:trendy_movies_app/models/movie_list.dart';
import 'package:trendy_movies_app/services/movie_list_service.dart';

part 'movie_list_event.dart';
part 'movie_list_state.dart';

class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  MovieListBloc() : super(const MovieListInitial()) {
    on<MovieFetchEvent>((event, emit) async {
      List<Result> newList =
          await MovieService().getMovieList(page: state.page + 1);
      emit(MoviesFetchState(state.moviesList + newList, state.page + 1));
    });
  }
}
