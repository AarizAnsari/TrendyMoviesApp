part of 'movie_details_bloc.dart';

abstract class MovieDetailsEvent extends Equatable {

  final int id;
  const MovieDetailsEvent({required this.id});

  @override
  List<Object> get props => [id];
}

class DetailsLoadEvent extends MovieDetailsEvent{
  const DetailsLoadEvent(int id) : super(id: id);
}