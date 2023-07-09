part of 'movie_details_bloc.dart';

abstract class MovieDetailsState extends Equatable {
  final MovieDetail? movieDetail;
  const MovieDetailsState({required this.movieDetail});
  
  @override
  List<Object?> get props => [movieDetail];
}

class MovieDetailsInitial extends MovieDetailsState {
  MovieDetailsInitial():super(movieDetail: initialValue);
}

class MovieDetailsFetch extends MovieDetailsState {
  const MovieDetailsFetch(MovieDetail? movieDetail):super(movieDetail: movieDetail);
}

MovieDetail? initialValue;