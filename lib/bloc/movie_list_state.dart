part of 'movie_list_bloc.dart';

const initialList = <Result>[];

abstract class MovieListState extends Equatable {

  final List<Result> moviesList;

  final int page;
   
  const MovieListState({required this.moviesList,required this.page});
  
  @override
  List<Object> get props => [moviesList,page];
}

class MovieListInitial extends MovieListState {
 const MovieListInitial() : super(moviesList: initialList,page: 0);
}

class MoviesFetchState extends MovieListState{
  const MoviesFetchState(List<Result> newList,int newPage) : super(moviesList: newList,page: newPage);
}

