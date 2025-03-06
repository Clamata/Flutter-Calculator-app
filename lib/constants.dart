import 'package:flutter/material.dart';

const Color kDarkGray = Color(0xFF222222);
const Color kCarbonBlack = Color(0xFF191919);
const Color kBlue = Color(0xFF4d5898);
const Gradient kGrayCircular = RadialGradient(
    colors: [Color(0xFF90A4AE), Color(0xFF78909C)], stops: [0.9, 0.9]);
const Gradient kBlueCircular = RadialGradient(
    colors: [Color(0xFF6d7df2), Color(0xFF5260cc)], stops: [0.9, 0.9]);
const Gradient kRedCircular = RadialGradient(
    colors: [Color(0xFFf2667d), Color(0xFFeb4a64)], stops: [0.9, 0.9]);
const Gradient kEmeraldCircular = RadialGradient(
    colors: [Color(0xFF009688), Color(0xFF00796B)], stops: [0.9, 0.9]);
const List<String> buttons = [
  'C', 'del', '%', ':',
  '7', '8', '9', 'x',
  '4', '5', '6', '-',
  '1', '2', '3', '+',
  'his', '0', '.', '='
];