import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trendy_movies_app/bloc/movie_list_bloc.dart';
import 'package:trendy_movies_app/widgets/movie_list_child.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final scrollController = ScrollController();
  @override
  void initState() {
    context.read<MovieListBloc>().add(MovieFetchEvent());
    scrollController.addListener(_scrollListner);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Movies", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[800],
      body: BlocBuilder<MovieListBloc, MovieListState>(
        builder: (context, state) {
          if (state.moviesList.isNotEmpty) {
            return 
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                     SizedBox(
                      height:MediaQuery.of(context).size.height-106,
                       child: ListView.builder(
                            controller: scrollController,
                            itemCount: state.moviesList.length +1,
                            itemBuilder: (context, index) {
                              if(index < state.moviesList.length){
                                return MovieListChild(
                                  url:'http://image.tmdb.org/t/p/w185/${state.moviesList[index].backdropPath}',
                                  title: state.moviesList[index].originalTitle,
                                  id: state.moviesList[index].id,
                                  desc: state.moviesList[index].overview);
                              }
                              else{
                                return const SizedBox(
                                  height: 40,
                                  child: Text('Loading...'),
                                );
                              }
                            }
                            ),
                     ),
                    
                  ],
                );
          } else {
            return const Center(
              child: SizedBox(
                height: 100,
                width: 100,
                child: CircularProgressIndicator()
                ),
            );
          }
        },
      ),
    );
  }
  void _scrollListner(){
  if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
    context.read<MovieListBloc>().add(MovieFetchEvent());
  }
  }
}

