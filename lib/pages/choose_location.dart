
import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}
class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations =[
    WorldTime(location: 'Hồ Chí Minh',flag: 'vietnam.png',url: 'Asia/Ho_Chi_Minh'),
    WorldTime(location: 'Berlin',flag: 'germany.png',url: 'Europe/Berlin'),
    WorldTime(location: 'Bangkok',flag: 'bangkok.png',url: 'Asia/Bangkok'),
    WorldTime(location: 'Chicago',flag: 'america.png',url: 'America/Chicago'),
    WorldTime(location: 'Abidjan',flag: 'africa.png',url: 'Africa/Abidjan'),
    WorldTime(location: 'Seoul',flag: 'korea.png',url: 'Asia/Seoul'),
    WorldTime(location: 'Tokyo',flag: 'japan.png',url: 'Asia/Tokyo'),
    WorldTime(location: 'Sydney',flag: 'australia.png',url: 'Australia/Sydney'),

  ];
    void upDataTime(index) async{
      WorldTime instance = locations[index];
      await instance.getTime();
      Navigator.pop(context,
      {
        'location': instance.location,
        'time': instance.time,
        'flag': instance.flag,
        'isDayTime': instance.isDayTime,
      });
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Choose Location'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
        child: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Card(
            child: ListTile(
              onTap: (){
                upDataTime(index);
              },
              title: Text(locations[index].location),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/flags/${locations[index].flag}')
                ),
              ),
            );
          }
        ),
      )
    );
  }
}
