import 'package:flutter/material.dart';
import 'package:world_time/services/world_dateTime.dart';

class myChoosingLocation extends StatefulWidget {
  @override
  _myChoosingLocationState createState() => _myChoosingLocationState();
}

class _myChoosingLocationState extends State<myChoosingLocation> {
  List<MyDateTimeLocation> theCountriesLocations = [
    MyDateTimeLocation(
        location: 'London', flag: 'london.jpg', url: 'Europe/London'),
    MyDateTimeLocation(
        location: 'Berlin', flag: 'germany.jpg', url: 'Europe/Berlin'),
    MyDateTimeLocation(
        location: 'Nairobi', flag: 'kenya.jpg', url: 'Africa/Nairobi'),
    MyDateTimeLocation(
        location: 'Jakarta', flag: 'jakarta.jpg', url: 'Asia/Jakarta'),
    MyDateTimeLocation(
        location: 'Cairo', flag: 'cairo.jpg', url: 'Africa/Cairo'),
    MyDateTimeLocation(location: 'Seoul', flag: 'seol.jpg', url: 'Asia/Seoul'),
    MyDateTimeLocation(
        location: 'Chicago', flag: 'chicago.jpg', url: 'America/Chicago'),
    MyDateTimeLocation(
        location: 'New_York', flag: 'new_york.jpg', url: 'America/New_York'),
    MyDateTimeLocation(
        location: 'Accra', flag: 'sumalia.jpg', url: 'Africa/Accra'),
  ];

  void upDateTime(index) async {
    MyDateTimeLocation newLocationInstance = theCountriesLocations[index];
    await newLocationInstance.getEndPointDateTimeLocationDate();
    // navigate to home screen
    Navigator.pop(context, {
      'location': newLocationInstance.location,
      'flag': newLocationInstance.flag,
      'time': newLocationInstance.time,
      'isDayTime': newLocationInstance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
//    print('build is now run');
    return Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   title: const Text(
        //     'choose location',
        //     style: TextStyle(
        //       letterSpacing: 1.0,
        //     ),
        //   ),
        //   centerTitle: true,
        //   elevation: 0.0,
        // ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: const Text("Choose Cities Locations"),
              centerTitle: true,
              elevation: 0.0,
              expandedHeight: 100,
              leading: GestureDetector(
                child: const Icon(Icons.arrow_back_ios),
                onTap: () => Navigator.pop(context),
              ),
            ),
            SliverList.builder(
              itemCount: theCountriesLocations.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(color: Colors.grey[100]),
                  padding: const EdgeInsets.symmetric(
                      vertical: 2.0, horizontal: 4.0),
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 4.0),
                  child: ListTile(
                    onTap: () => upDateTime(index),
                    title: Text(theCountriesLocations[index].location),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(
                          'assets/images/${theCountriesLocations[index].flag}'),
                    ),
                    trailing: Text(theCountriesLocations[index].url),
                  ),
                );
              },
            )
          ],
        ));
  }
}


/*

Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: theCountriesLocations.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(color: Colors.grey[100]),
                padding:
                    const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                child: ListTile(
                  onTap: () => upDateTime(index),
                  title: Text(theCountriesLocations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                        'assets/images/${theCountriesLocations[index].flag}'),
                  ),
                  trailing: Text(
                      "${theCountriesLocations[index].isDayTime == true ? theCountriesLocations[index].time : "none"}"),
                ),
              );
            },
          ),
        )


*/