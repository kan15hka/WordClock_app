import 'package:flutter/material.dart';
import 'package:bordered_text/bordered_text.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;
    print(data);
    String bgImage = data['isDayTime'] ? 'day.jpg' : 'night.jpg';
    Color cardColor = data['isDayTime']
        ? Color.fromARGB(255, 255, 191, 27)
        : Color.fromARGB(255, 116, 125, 252);
    Color iconColor = data['isDayTime']
        ? Color.fromARGB(255, 216, 109, 27)
        : Color.fromARGB(255, 216, 245, 253);

    Color bgColor = data['isDayTime']
        ? Color.fromARGB(255, 255, 175, 28)
        : Color.fromARGB(255, 1, 11, 248);

    Color textTimeColor = data['isDayTime']
        ? Color.fromARGB(255, 255, 175, 28)
        : Color.fromARGB(255, 216, 245, 253);

    Color textLocColor = data['isDayTime']
        ? Color.fromARGB(255, 163, 63, 27)
        : Color.fromARGB(255, 10, 137, 246);
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/$bgImage'), fit: BoxFit.cover)),
        child: Padding(
          padding: EdgeInsets.fromLTRB(0.0, 80.0, 0.0, 0.0),
          child: Column(
            children: <Widget>[
              Card(
                margin: EdgeInsets.all(5.0),
                color: cardColor,
                elevation: 0.0,
                child: TextButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'location': result['location'],
                        'flag': result['flag'],
                        'time': result['time'],
                        'date': result['date'],
                        'isDayTime': result['isDayTime']
                      };
                    });
                  },
                  icon: Icon(Icons.edit_location, color: iconColor, size: 30.0),
                  label: Text(
                    'EDIT LOCATION',
                    style: TextStyle(
                        color: iconColor,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'valo'),
                  ),
                ),
              ),
              SizedBox(
                height: 150.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data['location'],
                    style: TextStyle(
                      fontSize: 40.0,
                      letterSpacing: 2.0,
                      fontFamily: 'valo',
                      color: textLocColor,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 50.0,
              ),
              Text(
                data['date'],
                style: TextStyle(
                    fontSize: 30.0,
                    letterSpacing: 2.0,
                    fontFamily: 'clock',
                    fontWeight: FontWeight.w600,
                    color: textTimeColor),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                data['time'],
                style: TextStyle(
                    fontSize: 90.0,
                    letterSpacing: 2.0,
                    fontFamily: 'clock',
                    fontWeight: FontWeight.w600,
                    color: textTimeColor),
              )
            ],
          ),
        ),
      )),
    );
  }
}
