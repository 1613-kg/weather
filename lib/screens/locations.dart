import 'package:flutter/material.dart';

import 'package:weather/providers/information.dart';
import 'package:weather/widgets/search_bar.dart';

import '../models/constants.dart';
import '../widgets/description.dart';
import '../widgets/humidity_wid.dart';
import '../widgets/speed.dart';
import '../widgets/temp.dart';

class LoactionScreen extends StatefulWidget {
  static const routeName = '/LocationScreen';
  const LoactionScreen({super.key});
  @override
  State<LoactionScreen> createState() => _LoactionScreenState();
}

class _LoactionScreenState extends State<LoactionScreen> {
  Constants mycon = Constants();

  // String city = "";
  // String temp = "";
  // String hum = "";
  // String air_speed = "";
  // String des = "";
  // String main = "";
  // String icon = "";

  // void startApp(String city) async {
  //   information loc = information(city, temp, hum, air_speed, des, main, icon);
  //   await loc.getData(); //.catchError((error) {
  //   //   return showDialog<Null>(
  //   //       context: context,
  //   //       builder: (ctx) => AlertDialog(
  //   //             title: Text("An  error occured"),
  //   //             content: Text("Something went wrong."),
  //   //             actions: [
  //   //               TextButton(
  //   //                   onPressed: () {
  //   //                     Navigator.of(context).pop();
  //   //                   },
  //   //                   child: Text("Okay")),
  //   //             ],
  //   //           ));
  //   // }).then((_) => Navigator.of(context).pop);

  //   temp = loc.temp;
  //   hum = loc.humidity;
  //   air_speed = loc.air_speed;
  //   des = loc.description;
  //   main = loc.main;
  //   icon = loc.icon;

  //   Navigator.pushReplacementNamed(context, LoactionScreen.routeName,
  //       arguments: {
  //         "temp_value": temp,
  //         "hum_value": hum,
  //         "air_speed_value": air_speed,
  //         "des_value": des,
  //         "main_value": main,
  //         "icon_value": icon,
  //         "city_value": city,
  //       });
  // }

  @override
  void initState() {
    // TODO: implement initState
    // startApp(city);
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    //startApp(city);
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    final info = ModalRoute.of(context)?.settings.arguments as Map;
    //final search = ModalRoute.of(context)?.settings.arguments;

    // if (search != null) {
    //   search as Map;
    //   if (search?.isNotEmpty ?? false) {
    //     if (city == "") {
    //       city = info['city_value'];
    //     } else {
    //       city = search['searchText'];
    //     }
    //   }
    // }
    String temp = ((info['temp_value']).toString());
    String air = ((info['air_speed_value']).toString());
    if (temp == "NA") {
      print("NA");
    } else {
      temp = ((info['temp_value']).toString()).substring(0, 4);
      air = ((info['air_speed_value']).toString()).substring(0, 4);
    }
    String icon = info['icon_value'];
    String getcity = info['city_value'];
    String hum = info['hum_value'];
    String des = info['des_value'];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Container(
        color: mycon.primaryColor.withOpacity(.3),
        child: Column(
          children: [
            SearchBox(),
            SizedBox(
              height: 5,
            ),
            Description(icon, des, getcity),
            SizedBox(
              height: 30,
            ),
            Temperature(temp),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Humidity_wid(hum),
                Speed(air),
              ],
            )
          ],
        ),
      )),
    );
  }
}
