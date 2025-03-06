import 'dart:math';
import 'package:flutter/material.dart';
import '../constants.dart';
class Display extends StatelessWidget {
  const Display({super.key, this.output = ""});
  final String output;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height/4,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.blueGrey,
                    spreadRadius: BorderSide.strokeAlignOutside,
                    offset: Offset(0, -8)),
                BoxShadow(
                  color: Colors.white38,
                  spreadRadius: BorderSide.strokeAlignOutside,
                  offset: Offset(0, 8),)
              ],
              gradient: LinearGradient(
                  colors: [kDarkGray, kCarbonBlack],
                  stops: [0.4, 0.4],
                  transform: GradientRotation(pi / 3.8)),
              borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.height / 40)),
          child: Align(
            alignment: Alignment(0.9, 0),
            child: ListView(
              scrollDirection: Axis.horizontal,
              reverse: true,
              children: [Center(
                child: Text(
                  "$output ",
                  style: TextStyle(fontFamily: 'Minecraft',fontSize: MediaQuery.of(context).size.height/15),
                ),
              ),
              ]
            ),
          ),
        ),
      ],
    );
  }
}
