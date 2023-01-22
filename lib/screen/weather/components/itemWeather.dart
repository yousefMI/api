import 'package:api/screen/movie/screen/home/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemWeather extends StatelessWidget {
  const ItemWeather(
      {Key? key,
      required this.wind,
      required this.Weather,
      required this.name,
      required this.minTemp,
      required this.maxTemp})
      : super(key: key);

  final String wind, Weather, name, minTemp, maxTemp;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("City: ",
              style: TextStyle(
                color: Color(0xffdfddd9),
                fontSize: 17,
              )),
          Text(name,
              style: const TextStyle(
                color: Colors.white54,
                fontSize: 17,
              )),
        ],
      ),
      SizedBox(height: 10.h,),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("degree: ",
              style: TextStyle(
                color: Color(0xffdfddd9),
                fontSize: 17,
              )),
          Text(Weather,
              style: const TextStyle(
                color: Colors.white54,
                fontSize: 17,
              )),
        ],
      ),
      SizedBox(height: 10.h,),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Wind Speed: ",
              style: TextStyle(
                color: Color(0xffdfddd9),
                fontSize: 17,
              )),
          Text(wind,
              style: const TextStyle(
                color: Colors.white54,
                fontSize: 17,
              )),
        ],
      ),
      SizedBox(height: 10.h,),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("min degree: ",
              style: TextStyle(
                color: Color(0xffdfddd9),
                fontSize: 17,
              )),
          Text(minTemp,
              style: const TextStyle(
                color: Colors.white54,
                fontSize: 17,
              )),
        ],
      ),
      SizedBox(height: 10.h,),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Max degree: ",
              style: TextStyle(
                color: Color(0xffdfddd9),
                fontSize: 17,
              )),
          Text(maxTemp,
              style: const TextStyle(
                color: Colors.white54,
                fontSize: 17,
              )),
        ],
      ),
      //Spacer(),
       SizedBox(
        height: 50.h,
      ),

      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: const Text("I think the weather is good for watching a good movie",textAlign: TextAlign.center),
      ),
       SizedBox(height: 10.h,),
      Padding(
        padding:  EdgeInsets.symmetric(horizontal:500.w),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MovieScreen(),
                ));
          },
          style: ButtonStyle(
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(200.r))
    )),
          child: const Center(child: Text("Movies")),
        ),
      )
    ]);
  }
}
