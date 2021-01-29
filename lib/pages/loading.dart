import 'package:flutter/material.dart';
import 'package:loading_text/loading_text.dart';
import 'package:world_time/services/world_time.dart';
import 'package:loading_animations/loading_animations.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  //Need animation for the TEXT: LOADING...
  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Hồ Chí Minh',flag: 'vietnam.png',url: 'Asia/Ho_Chi_Minh');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoadingBouncingGrid.square(
              backgroundColor: Colors.black,
              size: 100.0,
            ),
            SizedBox(height: 20.0),
            LoadingText(
             text: 'Loading World Time',
              textStyle: TextStyle(
                letterSpacing: 2.0,
                fontSize: 17.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
