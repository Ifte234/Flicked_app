
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flicked_app/Services/api.dart';
import 'package:flicked_app/constants/Constants.dart';
import 'package:flutter/material.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({super.key, required this.snapshot});
  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        options: CarouselOptions(
          enableInfiniteScroll: true,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
          autoPlay: true,
          height: 250,
          autoPlayInterval: Duration(seconds: 2),
          viewportFraction: 0.55,
          autoPlayCurve: Curves.fastOutSlowIn,
        ),
        itemCount: snapshot.data.length,
        itemBuilder: (context, Itemindex, pageviewIndex) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(13),
            child: SizedBox(
              height: 300,
              width: 200,
              child:

              Image.network(fit:BoxFit.cover,
                  filterQuality: FilterQuality.high, '${Constants.imagePath}${snapshot.data[Itemindex].posterPath}'),

            ),


           );
      },
      ),);}}
