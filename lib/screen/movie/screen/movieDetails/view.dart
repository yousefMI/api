import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieDetails extends StatelessWidget {
  MovieDetails({
    Key? key,
    required this.title,
    required this.details,
    required this.image,
    required this.relase,
    required this.voteAverage,
    required this.voteCount,
  }) : super(key: key);
  final String title, image, details, relase, voteCount;
  final double voteAverage;

  final relaseController = TextEditingController();
  String? x;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Movies"),centerTitle: true ,elevation: 0,backgroundColor:Colors.transparent ),
        body: FutureBuilder(
          future: Dio().get(
              "https://api.themoviedb.org/3/discover/movie?api_key=2001486a0f63e9e4ef9c4da157ef37cd&page=9"),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              //final model =MoviesData.fromJson(snapshot.data!.data);

              return SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.network(
                          "https://image.tmdb.org/t/p/original/$image"),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 50.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             SizedBox(height: 10.h,),
                            Center(
                              child: Text(
                                title,
                                style: const TextStyle(
                                    fontSize: 20, ),
                              ),
                            ),
                             SizedBox(height: 10.h,),
                            const Text("Details",
                                style: TextStyle(color:Color(0xffdfddd9),
                                    fontSize: 17, )),
                             SizedBox(height: 1.h,),
                            Text("       $details", style: const TextStyle(fontSize: 15,color: Colors.white54)),


                            Row(
                              children: [
                                const Text("Release date",
                                    style: TextStyle(color:Color(0xffdfddd9),
                                        fontSize: 17,)),
                                 SizedBox(

                                  width: 70.w,
                                ),
                                SizedBox(
                                  width: 800.w,
                                  child: TextFormField(
                                    readOnly: true,
                                    controller: relaseController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: relase),
                                  ),
                                ),
                              ],
                            ),
                            //Text(relase, style: const TextStyle(fontSize: 15)),

                            Row(
                              children: [
                                const Text("Vote average",
                                    style: TextStyle(color:Color(0xffdfddd9),
                                        fontSize: 17,
                                        )),
                                 SizedBox(
                                  width: 70.w,
                                ),
                                SizedBox(
                                  width: 800.w,
                                  child: TextFormField(
                                    readOnly: true,
                                    controller: relaseController,
                                    decoration: InputDecoration(
                                        hintStyle: voteAverage >= 7
                                            ? const TextStyle(
                                                color: Colors.green)
                                            : voteAverage >= 5
                                                ? const TextStyle(
                                                    color: Colors.yellow)
                                                : const TextStyle(
                                                    color: CupertinoColors
                                                        .destructiveRed),
                                        border: InputBorder.none,
                                        hintText: "$voteAverage/10"),
                                  ),
                                ),
                              ],
                            ),

                            //Text(voteAverage + "/10", style: const TextStyle(fontSize: 15)),

                            Row(
                              children: [
                                const Text("Vote count",
                                    style: TextStyle(color:Color(0xffdfddd9),
                                        fontSize: 17,)),
                                 SizedBox(
                                  width: 70.w,
                                ),
                                SizedBox(
                                  width: 800.w,
                                  child: TextFormField(
                                    readOnly: true,
                                    controller: relaseController,
                                    decoration: InputDecoration(
                                        hintStyle: const TextStyle(
                                            color: Colors.white54),
                                        border: InputBorder.none,
                                        hintText: voteCount),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ]),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
