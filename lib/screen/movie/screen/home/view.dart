import 'package:api/screen/movie/screen/home/component/item.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'component/model.dart';


class MovieScreen extends StatelessWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Movies"),centerTitle: true, backgroundColor:Colors.transparent ,elevation: 0,),
      body: FutureBuilder(
        future: Dio().get(
            "https://api.themoviedb.org/3/discover/movie?api_key=2001486a0f63e9e4ef9c4da157ef37cd&page=9"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final model = MoviesData.fromJson(snapshot.data!.data);
            return GridView.builder(
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 5 / 5,
                  crossAxisCount: 2,
                  mainAxisSpacing: 7.h,
                  crossAxisSpacing: 30.w),
              itemCount: model.results.length,
              itemBuilder: (context, index) => ItemMovies(
                relase:model.results[index].releaseDate ,
                voteAverage: model.results[index].voteAverage!.toDouble(),
                voteCount:model.results[index]. voteCount.toString(),
                details: model.results[index].overview,
                screen: model.results[index].posterPath,
                id: model.results[index].id,
                image: model.results[index].backdropPath,
                title: model.results[index].title,
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator(color: Colors.white,));
          }
        },
      ),
    );
  }
}
