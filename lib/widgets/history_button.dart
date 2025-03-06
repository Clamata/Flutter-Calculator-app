import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../providers/output_provider.dart';
class HistoryButton extends StatelessWidget {
  const HistoryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blueGrey[300],
          borderRadius:
          BorderRadius.circular(MediaQuery.of(context).size.height / 50),
          gradient: kEmeraldCircular),
      child: DropdownMenu<String>(
        textStyle: TextStyle(color: Colors.transparent),
        inputDecorationTheme: InputDecorationTheme(border: InputBorder.none,),
        trailingIcon: Center(child: Icon(Icons.history_toggle_off)),
        selectedTrailingIcon: Center(child: Icon(Icons.history_toggle_off)),
        menuStyle: MenuStyle(backgroundColor: WidgetStatePropertyAll(kBlue),),
        dropdownMenuEntries: context
            .read<OutputProvider>()
            .history
            .map((output) => DropdownMenuEntry(
            value: output,
            label: output,
            style: MenuItemButton.styleFrom(
                textStyle:
                TextStyle(fontFamily: 'Minecraft'))))
            .toList(),
        onSelected: (value) {
          if(value == 'Clear'){
            context.read<OutputProvider>().clearHistory();
          }
          else {
            context.read<OutputProvider>().setOutput(value!);
          }
        },
      ),
    );
  }
}
