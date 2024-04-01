import 'dart:convert';
import "package:http/http.dart" as http ;
import 'package:intl/intl.dart';


class WorldTime {

  String location; // location name
  String? time; // time in the location
  String flag; // url to an asset flag icon
  String url ; // location url for the api enpoint
  bool? isDay; // if day or not

  WorldTime({required this.location, required this.flag, required this.url});


  Future<void> getData() async {
  try {
    // make the request
    http.Response response = await http.get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    Map data = jsonDecode(response.body);

    //get properties from data
    String dateTime = data["datetime"];
    String offset = data["utc_offset"].substring(1,3);

    //create datetime object
    DateTime now = DateTime.parse(dateTime);
    now = now.add(Duration(hours: int.parse(offset)));


    isDay = now.hour > 6 && now.hour < 20 ? true : false ;
    time = DateFormat.jm().format(now); // set the time property


  }
  catch (e) {
    print("Error :  $e") ;
    time = "There are some Bugs " ;
  }

  }

}



