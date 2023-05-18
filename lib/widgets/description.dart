import 'package:flutter/material.dart';

class Description extends StatefulWidget {
  //const Description({super.key});

  String icon;
  String desc;
  String loc;

  Description(this.icon, this.desc, this.loc);

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white60,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
              "http://openweathermap.org/img/wn/${widget.icon}@2x.png"),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("${widget.desc}"),
              Text("IN ${widget.loc}"),
            ],
          )
        ],
      ),
    );
  }
}
