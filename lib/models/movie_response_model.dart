import 'dart:convert';
import 'movie_model.dart';

class MovieResponseModel {
  int page;
  final int totalResults;
  final int totalPages;
  final List<MovieModel> movies;

  MovieResponseModel(
      {this.totalResults, this.totalPages, this.movies, this.page});

  factory MovieResponseModel.fromJson(String str) =>
      MovieResponseModel.fromMap(json.decode(str));

  factory MovieResponseModel.fromMap(Map<String, dynamic> jsond) =>
    //List<MovieModel> fetchedMovies = List<MovieModel>();
    // De forma imperativa funciona, usando o map nao consegui :(
    //for (int i = 0; i < jsond['results'].length; i++) {
    //  fetchedMovies.add(MovieModel.fromMap(jsond['results'][i]));
    //}
    MovieResponseModel(
        page: jsond['page'],
        totalResults: jsond['total_results'],
        totalPages: jsond['total_pages'],
        movies: List<MovieModel>.generate(jsond['results'].length, (index) => MovieModel.fromMap(jsond['results'][index]))
      );
}
