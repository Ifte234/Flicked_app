import 'dart:convert';

import 'package:flicked_app/Model/movie.dart';
import 'package:http/http.dart' as http;
import 'package:flicked_app/constants/Constants.dart';

class Api {
  static const trending_url =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.api_key}';
  static const top_rated_url =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.api_key}';

  static const upcoming_url =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.api_key}';

  Future<List<Movie>> getTrendingMovies()async{
    final response = await http.get(Uri.parse(Api.trending_url));
    if(response.statusCode ==200){
      final decodedData = json.decode(response.body)['results'] as List;
      print(decodedData);
      return decodedData.map((movie) => Movie.fromjson(movie)).toList();
    } else {
      throw Exception("Something went WRONG!");
    }

  }

  Future<List<Movie>> getTopRatedMovies()async{
    final response = await http.get(Uri.parse(Api.top_rated_url));
    if(response.statusCode ==200){
      final decodedData = json.decode(response.body)['results'] as List;
      print(decodedData);
      return decodedData.map((movie) => Movie.fromjson(movie)).toList();
    } else {
      throw Exception("Something went WRONG!");
    }

  }

  Future<List<Movie>> getUpcomingMovies()async{
    final response = await http.get(Uri.parse(Api.upcoming_url));
    if(response.statusCode ==200){
      final decodedData = json.decode(response.body)['results'] as List;
      print(decodedData);
      return decodedData.map((movie) => Movie.fromjson(movie)).toList();
    } else {
      throw Exception("Something went WRONG!");
    }

  }
}
