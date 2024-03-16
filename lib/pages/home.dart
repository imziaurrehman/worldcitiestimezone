import 'package:flutter/material.dart';
import 'package:world_time/main.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, dynamic> myData = {};
  @override
  Widget build(BuildContext context) {
    myData = myData.isNotEmpty
        ? myData
        : ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    print(myData);
    String bgImage = myData['isDayTime'] ? 'day02.jpg' : 'night03.jpg';
    Color bgColor = myData['isDayTime'] ? Colors.blueAccent : Colors.indigo;
//  Color txtColor = myData['isDayTime'] ? Colors.white : Colors.white  ;
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, '/location');
                  setState(() {
                    myData = {
                      'time': result['time'],
                      'location': result['location'],
                      'flag': result['flag'],
                      'isDayTime': result['isDayTime'],
                    };
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 120),
                  child: Container(
                    height: 45,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        color: Colors.white38,
                        borderRadius: BorderRadius.circular(12)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.location_city),
                        Text(
                          "Edit Location",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(color: Colors.white24),
                child: Column(
                  children: [
                    Text(
                      myData['location'],
                      style: const TextStyle(
                        fontSize: 40.0,
                        letterSpacing: 2.0,
                        color: Colors.white,
                      ),
                    ),
                    const Divider(
                      height: 2,
                    ),
                    Text(
                      myData['time'],
                      style: const TextStyle(
                        fontSize: 50.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
