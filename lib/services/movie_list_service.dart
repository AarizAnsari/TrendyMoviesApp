import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:trendy_movies_app/models/movie_details.dart';
import 'package:trendy_movies_app/models/movie_list.dart';

class MovieService {
  String baseUrl = "https://api.themoviedb.org/3/";

  final String _key = "3aa2c997ec3eb7851fa0e377b062b620";

  var client = http.Client();

  Future<List<Result>> getMovieList({int page = 1}) async {
    var uri =
        Uri.parse('${baseUrl}trending/movie/day?page=$page&language=en-US&api_key=$_key');

    var res = await client.get(uri);
    if (res.statusCode == 200) {
      var json = res.body;
      return movieFromJson(json).results;
    } else {
      if (kDebugMode) {
        print('movie list api failed with status code ${res.statusCode}');
      }
      return [];
    }
  }

  Future<MovieDetail?> getMovieDetails(int id) async {
    MovieDetail? movieDetails;

    var uri = Uri.parse('${baseUrl}movie/$id?api_key=$_key');
    var res = await client.get(uri);
    if (res.statusCode == 200) {
      var json = res.body;
      movieDetails = movieDetailFromJson(json);
    }
    else{
      if (kDebugMode) {
        print('movie details api failed with status code ${res.statusCode}');
      }
    }
    return movieDetails;
  }
}
