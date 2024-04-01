// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, dynamic>? arguments;

  @override
  Widget build(BuildContext context) {
    arguments ??= ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    print("Received arguments: $arguments"); // Add this line to check the received arguments

    // Check if arguments is not null and is of type Map<dynamic, dynamic>
    if (arguments != null && arguments is Map<dynamic, dynamic> ) {
      // Extract the location from arguments
      var location = arguments!['location'];
      var time = arguments!['time'];
      // set Background image based on the bool variable
      var bgImg = arguments!['isDay'] ? 'day.png' : 'night.png' ;

      return Scaffold(
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(bgImg),
                fit: BoxFit.cover ,
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: SafeArea(
                child: Column(
                  children: <Widget>[
                    TextButton (
                      onPressed: () async {
                       dynamic result =  await Navigator.pushNamed(context, "/location");
                       setState(() {
                         arguments  = {
                           'time' : result['time'],
                           'location' : result['location'],
                           'isDay' : result['isDay'] ,
                           'flag' : result['flag']
                         };
                       });
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children:  [
                          Icon(
                            Icons.edit_location,
                            color: Colors.grey[300],
                          ),
                          SizedBox(width: 8), // Add some space between the icon and text
                          Text(
                            'Edit Location',
                            style: TextStyle(
                              color: Colors.grey[300],
                              fontSize: 16, // Adjust font size as needed
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '$location',
                          style: TextStyle(fontSize: 20.0 ,  color: Colors.grey[300],), // Adjust font size as needed
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0) ,
                Text(
                  '$time',
                  style: TextStyle(fontSize: 66.0,  color: Colors.grey[300],),
                )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      // Handle the case where arguments is null or not of the expected type
      // For example, you can return a loading indicator or display an error message
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(), // Show a loading indicator
        ),
      );
    }
  }
}
