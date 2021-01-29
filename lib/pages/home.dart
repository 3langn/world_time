import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data ={};


  @override
  Widget build(BuildContext context) {
    //set properties
    data = data.isNotEmpty ? data :ModalRoute.of(context).settings.arguments;

    String tfImg = data['isDayTime'] ? 'morning.png':'night.png';
    Color tfColor = data['isDayTime'] ? Colors.black:Colors.white70;
    Color tfColorScaffold = data['isDayTime'] ? Colors.yellow[200]:Colors.black12;
    Color tfColorButtonLocation = data['isDayTime'] ? Colors.white70:Colors.white70;
    return Scaffold(
      backgroundColor: tfColorScaffold,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/$tfImg'),
                    fit: BoxFit.cover,
                )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
              child: Column(
              children: <Widget>[
                RaisedButton.icon(
                  onPressed: () async{
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data ={
                        'location': result['location'],
                        'time':result['time'],
                        'flag':result['flag'],
                        'isDayTime':result['isDayTime'],
                      };
                    });
                  },
                    icon: Icon(
                      Icons.edit_location,
                      color:tfColor,
                    ),
                  color:tfColorButtonLocation,
                  label: Text(
                    'Edit Location',
                    style: TextStyle(
                    color:tfColor
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: tfColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 80.0,
                    letterSpacing: 2.0,
                    color: tfColor,
                  ),
                )
        ],
      ),
            ),
          )),
    );
  }
}
