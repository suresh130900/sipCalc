import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sip_calc/Views/demo.dart';
import 'package:sip_calc/Views/graph.dart';

import '../main.dart';
import 'lineGraph.dart';
import 'sipCalc.dart';

class ThemeColour extends StatelessWidget {
  const ThemeColour({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          CupertinoIcons.graph_circle
        ),
        title: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 20,
            ),
            Text('Sip Calculator'),
          ],
        ),
        actions: [
          ThemeSwitchButton(),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SipCalc(),
            // Container(
            //   height: 300,
            //   child: LineChartSample1(),
            // ),
            // Container(
            //   height: 400,
            //   child: SIPCalculatorWidget(),
            // ),
          ],
        ),
      ),
    );
  }
}
class ThemeSwitchButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return IconButton(
      icon: Icon(isDarkTheme ? Icons.wb_sunny : Icons.nights_stay),
      onPressed: () {
        Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
      },
    );
  }
}
