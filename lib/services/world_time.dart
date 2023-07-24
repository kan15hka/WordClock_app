import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time = "";
  String date = "";
  String flag;
  String url;
  bool isDayTime = true;

  WorldTime({
    required this.location,
    required this.flag,
    required this.url,
  });

  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      //jsonDecode converts the string from api to an object
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      print(data);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      isDayTime = now.hour > 6 && now.hour < 19 ? true : false;
      time = DateFormat.jm().format(now);
      date = DateFormat.yMMMMd().format(now);
      print(date);
    } catch (e) {
      print('Caught Error: $e');
      time = 'Error while fetching data!!!';
    }
  }
}
