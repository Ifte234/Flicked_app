
import 'package:flutter/material.dart';

import '../constants/Constants.dart';

class MoviesSlider extends StatelessWidget {
  const MoviesSlider({super.key, required this.snapshot});
  final AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {

    return  SizedBox(
      height: 200,
      child: ListView.builder(
          itemCount: snapshot.data.length,
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: SizedBox(
                  height: 200,
                  width: 150,
                  child: Image.network(
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                    // 'https://image.tmdb.org/t/p/w500/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg'
                    '${Constants.imagePath}${snapshot.data![index].posterPath}'
                  ),
                ),
              ),

                    );
          }),
    );
  }
}
