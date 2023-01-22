import 'package:api/screen/movie/screen/movieDetails/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemMovies extends StatelessWidget {
  const ItemMovies({Key? key, required this.image, required this.title, required this.screen, required this.details, required this.id, required this.relase, required this.voteAverage, required this.voteCount})
      : super(key: key);
  final String image, title,screen,details,relase,voteCount;
  final double voteAverage;
  final int id;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  MovieDetails(image:screen,

                    details:details,
                    relase:relase,
                    voteAverage: voteAverage,
                    voteCount:voteCount,
                    title: title,
                  ),
            ));
      },

      child: Stack(
        children: [

          SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Image.network(
                  "https://image.tmdb.org/t/p/original/$image",
                  fit: BoxFit.fill)),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 50.h,
              color: CupertinoColors.destructiveRed.withOpacity(0.6),
              child: Center(child: Text(title,textAlign: TextAlign.center,)),
            ),
          )
        ],
      ),
    );
  }
}
