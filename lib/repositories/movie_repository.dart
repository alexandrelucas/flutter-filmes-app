import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../core/api.dart';
import '../errors/movie_error.dart';
import '../models/movie_detail_model.dart';
import '../models/movie_response_model.dart';

class MovieRepository {
  final Dio apiReq = Dio(dioOptions);
  final String language = 'pt-BR';

  Future<Either<MovieError, MovieResponseModel>> fetchAllMovies(
      int page) async {
    try {
      final response = await apiReq.get('/movie/popular?page=$page&language=$language');
      final model = MovieResponseModel.fromMap(response.data);
      return Right(model);
    } on DioError catch (error) {
      if (error.response != null)
        return Left(
            MovieRepositoryError(error.response.data['status_message']));
      else
        return Left(MovieRepositoryError(serverErrorMsg));
    } on Exception catch (error) {
      return Left(MovieRepositoryError(error.toString()));
    }
  }

  Future<Either<MovieError, MovieResponseModel>> fetchMoviesBySearch(
      String query, int page) async {
    try {
      final response = await apiReq.get('/search/movie?query=$query&language=$language&page=$page');
      final model = MovieResponseModel.fromMap(response.data);
      return Right(model);
    } on DioError catch (error) {
      if (error.response != null)
        return Left(
            MovieRepositoryError(error.response.data['status_message']));
      else
        return Left(MovieRepositoryError(serverErrorMsg));
    } on Exception catch (error) {
      return Left(MovieRepositoryError(error.toString()));
    }
  }

  Future<Either<MovieError, MovieDetailModel>> fetchMovieById(int id) async {
    try {
      final response = await apiReq.get('/movie/$id?language=$language');
      final model = MovieDetailModel.fromMap(response.data);
      return Right(model);
    } on DioError catch (error) {
      if (error.response != null)
        return Left(
            MovieRepositoryError(error.response.data['status_message']));
      else
        return Left(MovieRepositoryError(serverErrorMsg));
    } on Exception catch (error) {
      return Left(MovieRepositoryError(error.toString()));
    }
  }
}
