import 'dart:ffi';

class Movie {
  String title;
  String backdrop;
  String originalTitle;
  String overview;
  String posterPath;
  String releaseDate;
  // Double voteAverage;
  Movie(
      {required this.backdrop,
      required this.originalTitle,
      required this.overview,
      required this.posterPath,
      required this.releaseDate,
      required this.title,
      // required this.voteAverage
      });
  // We are going to create constructor to get record of json for Movie class
  // factory  Movie.fromjson--CONSTRUCTOR NAME
  // --(Map<String,dynamic> json) --KEY,VALUE PAIR OF JSON DATA IN API
  // Key is always String but value may be string ,double,bool or any thing else
  // so we use dynamic{
  factory Movie.fromjson(Map<String, dynamic> json) {
    return Movie(
        // Now we will use same key as in Movie class and same name as in our api to get api data

        backdrop: json['backdrop_path'],
        originalTitle: json['original_title'],
        overview: json['overview'],
        posterPath: json['poster_path'],
        releaseDate: json['release_date'],
        title: json['title']);
        // voteAverage: json['vote_average']);
  }

//   And in case if I want to send data to api server
//   Map<String, dynamic> tojson() => {'title': title, 'backdrop': backdrop};
}
