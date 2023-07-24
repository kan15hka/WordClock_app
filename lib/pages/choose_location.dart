import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Athens', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url: 'Asia/Kolkata', location: 'Kolkata', flag: 'india.png'),
  ];
  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'date': instance.date,
      'isDayTime': instance.isDayTime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 43, 42, 42),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 70, 69, 69),
        title: Text(
          'Choose a location',
          style: TextStyle(
            fontSize: 15.0,
            letterSpacing: 2.0,
            fontFamily: 'valo',
            color: Colors.grey,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0),
            child: Card(
                child: ListTile(
              tileColor: Color.fromARGB(255, 27, 27, 27),
              iconColor: Colors.grey[750],
              onTap: () {
                updateTime(index);
              },
              title: Text(
                locations[index].location,
                style: TextStyle(
                  fontSize: 20.0,
                  letterSpacing: 2.0,
                  fontFamily: 'clock',
                  color: Colors.grey,
                ),
              ),
              leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/${locations[index].flag}')),
            )),
          );
        },
      ),
    );
  }
}
