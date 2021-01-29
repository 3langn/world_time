import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String flag;
  String url;
  String location;
  String time;
  bool isDayTime;

  WorldTime({this.location,this.flag,this.url});

  Future<void> getTime() async {
    try {

      Response response = await get('http://worldtimeapi.org/api/timezone/$url');

      Map data = jsonDecode(response.body);

      //get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      //create DateTime objects
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      //set the time property
      isDayTime = now.hour > 6 && now.hour <13;
      time = DateFormat.jm().format(now);
    }catch(e){
      print('Error is :$e');
      time ='Can\'t get data';
    }
  }
}
