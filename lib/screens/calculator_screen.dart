import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../providers/output_provider.dart';
import '../widgets/calc_button.dart';
import '../widgets/display.dart';
import '../widgets/history_button.dart';


class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 5,
              child: Column(
                children: [
                  SizedBox(
                    height: height / 7,
                  ),
                  Display(
                    output: context.watch<OutputProvider>().output,
                  ),
                ],
              ),
          ),
          Expanded(
            flex: 6,
            child: SizedBox(
              width: width * 0.85,
              //Grid of buttons
              child: GridView.builder(
                  itemCount: 20,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: height / 13,
                      crossAxisSpacing: width / 20,
                      mainAxisSpacing: height / 50,
                      crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    if (buttons[index] == 'C') {
                      return CalcButton(
                        onPressed: () {
                          //Clear the output
                          context.read<OutputProvider>().clearOutput();
                        },
                        gradient: kRedCircular,
                        color: Colors.white70,
                        text: buttons[index],
                      );
                    } else if (buttons[index] == 'del') {
                      return CalcButton(
                        onPressed: () {
                          //Delete the last character or number
                          context.read<OutputProvider>().pop();
                        },
                        gradient: kRedCircular,
                        color: Colors.white70,
                        text: '⌫',
                      );
                    } else if (buttons[index] == ':') {
                      return CalcButton(
                          onPressed: () {
                            context.read<OutputProvider>().putOperator(buttons[index]);
                          },
                          gradient: kBlueCircular,
                          color: Colors.white70,
                          icon: CupertinoIcons.divide);
                    } else if (buttons[index] == '=') {
                      return CalcButton(
                          onPressed: () {
                            //Calculate the output
                            context.read<OutputProvider>().calc();
                          },
                          gradient: kBlueCircular,
                          color: Colors.white70,
                          text: buttons[index]);
                    } else if (buttons[index] == '%' ||
                        buttons[index] == 'x' ||
                        buttons[index] == '-' ||
                        buttons[index] == '+') {
                      return CalcButton(
                          onPressed: () {
                            context.read<OutputProvider>().putOperator(buttons[index]);
                          },
                          gradient: kBlueCircular,
                          color: Colors.white70,
                          text: buttons[index]);
                    } else if (buttons[index] == '.') {
                      return CalcButton(
                        onPressed: () {
                          context.read<OutputProvider>().putOperator(buttons[index]);
                        },
                        text: buttons[index],
                      );
                    } else if (buttons[index] == 'his') {
                      return HistoryButton();
                    } else {
                      return CalcButton(
                        onPressed: () {
                          //Add the triggered button sign to the output
                          context.read<OutputProvider>().push(buttons[index]);
                        },
                        text: buttons[index],
                      );
                    }
                  },
              ),
            ),
          )
        ],
      ),
    );
  }
}
