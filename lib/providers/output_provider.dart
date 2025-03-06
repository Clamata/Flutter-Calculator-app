import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class OutputProvider extends ChangeNotifier {
  String output;
  List<String> history = ['Clear'];
  OutputProvider({this.output = '0'});

  void setOutput(String output) {
    this.output = output;
    notifyListeners();
  }

  void push(String x) {
    //if output has user input
    if (output != '0') {
      output += x;
    } else {
      output = x;
    }
    notifyListeners();
  }

  void clearOutput() {
    output = '0';
    notifyListeners();
  }

  void pop() {
    //if output has user input
    if (output.length > 1) {
      output = output.substring(0, output.length - 1);
    } else {
      clearOutput();
    }
    notifyListeners();
  }

  void calc() {
    //execute only if output doesn't contain any dividing by 0 and any expression at the end
    if (!output.contains(RegExp(r'[:\x\-+\.{:0}]$'))) {
      //add output to the history
      history.insert(0, output);
      if (history.length > 10) {
        history.removeAt(history.length - 2);
      }
      Parser parser = Parser();
      Expression expression = parser.parse(
          output.replaceAll('x', '*').replaceAll(':', '/').replaceAllMapped(
        RegExp(r'(\d+(\.\d+)?)([+\-])(\d+(\.\d+)?)%'),
        (match) {
          // (\d+(\.\d+)?)
          String? firstNum = match.group(1);
          // ([+\-])
          String? operator = match.group(3);
          // (\d+(\.\d+)?)
          String? secondNum = match.group(4);
          //Example: '10-50%' is replaced by '10-(10*50%)'
          return ('$firstNum$operator($firstNum*$secondNum%)');
        },
      ).replaceAll('%', '*0.01'));
      ContextModel contextModel = ContextModel();
      output =
          expression.evaluate(EvaluationType.REAL, contextModel).toString();
      if (output.substring(output.length - 2, output.length) == '.0') {
        output = output.substring(0, output.length - 2);
      }
    }
    notifyListeners();
  }

  void putOperator(String operator) {
    //If output ends with expression
    if (RegExp(r'[.\x:+\-%]$').hasMatch(output)) {
      //delete the expression at the end
      output = output.substring(0, output.length - 1);
    }
    output += operator;
    notifyListeners();
  }

  void clearHistory() {
    history = ['Clear'];
    notifyListeners();
  }
}
