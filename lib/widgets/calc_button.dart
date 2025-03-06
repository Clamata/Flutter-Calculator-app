import 'package:flutter/material.dart';
import '../constants.dart';
class CalcButton extends StatelessWidget {
  const CalcButton({super.key, this.onPressed, this.text = "", this.icon, this.gradient = kGrayCircular, this.color = Colors.black45});
  final String text;
  final Gradient gradient;
  final VoidCallback? onPressed;
  final IconData? icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Color(0xFF6d7df2),
      borderRadius:
          BorderRadius.circular(MediaQuery.of(context).size.height / 90),
      onTap: onPressed ?? () {},
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blueGrey[300],
            borderRadius:
                BorderRadius.circular(MediaQuery.of(context).size.height / 50),
            gradient: gradient),
        child: Center(
            child: icon != null
                ? Icon(icon, color: color,size: MediaQuery.of(context).size.height / 30,)
                : Text(
                    text,
                    style: TextStyle(
                        fontFamily: 'Minecraft',
                        fontSize: MediaQuery.of(context).size.height / 30,
                        color: color,
                        fontWeight: FontWeight.bold),
                  )),
      ),
    );
  }
}
