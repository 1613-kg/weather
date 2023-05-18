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
