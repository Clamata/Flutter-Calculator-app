import 'package:flutter/material.dart';
import '../constants.dart';

class CalcButton extends StatelessWidget {
  const CalcButton(
      {super.key,
      this.onPressed,
      this.text = "",
      this.icon,
      this.gradient = kGrayCircular,
      this.color = Colors.black45});
  final String text;
  final Gradient gradient;
  final VoidCallback? onPressed;
  final IconData? icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height/90),
        gradient: gradient,
      ),
      child: RawMaterialButton(
          onPressed: onPressed ?? () {},
          padding: EdgeInsets.all(0),
          child: Center(
            child: icon != null
                ? Icon(
                    icon,
                    color: color,
                    size: MediaQuery.of(context).size.height / 30,
                  )
                : Text(
                    text,
                    style: TextStyle(
                        fontFamily: 'Minecraft',
                        fontSize: MediaQuery.of(context).size.height / 30,
                        color: color,
                        fontWeight: FontWeight.bold),
                  ),
          )),
    );
  }
}
