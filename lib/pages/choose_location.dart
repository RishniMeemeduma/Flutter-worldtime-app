import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worldtimeapp/services/world_time.dart';


class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();


}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'london',flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin',location: 'berlin',flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo',location: 'cairo',flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi',location: 'Nairobi',flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago',location: 'Chicago',flag: 'usa.png'),
    WorldTime(url: 'America/New_york',location: 'New york',flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul',location: 'Seoul',flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta',location: 'Jakarta',flag: 'indonesia.png')
  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    // NAVIGATE TO HOME
    Navigator.pop(context,{
      'location':instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime':instance.isDaytime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose the location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index){
            return Card(
              child: ListTile(
                onTap: (){updateTime(index);},
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            );
          }
      ),
    );
  }
}
