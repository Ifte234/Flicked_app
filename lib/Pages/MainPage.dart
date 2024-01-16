import 'package:flicked_app/Services/api.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Model/movie.dart';
import '../widgets/MoviesSlider.dart';
import '../widgets/TrendingMoviesSlider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late Future<List<Movie>> trending_movies;
  late Future<List<Movie>> top_rated_movies;
  late Future<List<Movie>> upcoming_movies;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    trending_movies = Api().getTrendingMovies();
    top_rated_movies = Api().getTopRatedMovies();
    upcoming_movies = Api().getUpcomingMovies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "FLICKED",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              " Trending Movies",
              style: GoogleFonts.aBeeZee(fontSize: 25),
            ),
            SizedBox(
              height: 8,
            ),
            // TrendingMovies(snapshot: snapshot,),
            SizedBox(
              child: FutureBuilder(
                future: trending_movies,
                builder: (BuildContext contex,snapshot){
                  if(snapshot.hasError){
                    return Center(child: Text(snapshot.hasError.toString()),);
                  }else if(snapshot.hasData){
                    final data = snapshot.data;
                    print(data);
                    return TrendingMovies(snapshot: snapshot,);
                  }else return Center(child: CircularProgressIndicator(),);
                },

              ),
            ),

            //***********************Top Rated Movies*******************************
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "Top Rated Movies",
                style: GoogleFonts.aBeeZee(fontSize: 25),
              ),
            ),
          SizedBox(
            child: FutureBuilder(
              future: top_rated_movies,
              builder: (BuildContext contex,snapshot){
                if(snapshot.hasError){
                  return Center(child: Text(snapshot.hasError.toString()),);
                }else if(snapshot.hasData){
                  final data = snapshot.data;
                  print(data);
                  return MoviesSlider(snapshot: snapshot,);
                }else return Center(child: CircularProgressIndicator(),);
              },

            ),
          ),
            //**********************Upcoming Movies **************************
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "Upcoming Movies",
                style: GoogleFonts.aBeeZee(fontSize: 25),
              ),
            ),
            SizedBox(
              child: FutureBuilder(
                future: upcoming_movies,
                builder: (BuildContext contex,snapshot){
                  if(snapshot.hasError){
                    return Center(child: Text(snapshot.hasError.toString()),);
                  }else if(snapshot.hasData){
                    final data = snapshot.data;
                    print(data);
                    return MoviesSlider(snapshot: snapshot,);
                  }else return Center(child: CircularProgressIndicator(),);
                },

              ),
            ),
          ],
        ),
      ),
    );
  }
}


