// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';
//
// class Graph extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Flutter Line Chart'),
//         ),
//         body: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: LineChart(
//             LineChartData(
//               gridData: FlGridData(show: false),
//               titlesData: FlTitlesData(show: false),
//               borderData: FlBorderData(
//                 show: true,
//                 border: Border.all(color: const Color(0xff37434d), width: 1),
//               ),
//               minX: 0,
//               maxX: 7,
//               minY: 0,
//               maxY: 6,
//               lineBarsData: [
//                 LineChartBarData(
//                   spots: [
//                     FlSpot(0, 3),
//                     FlSpot(1, 1),
//                     FlSpot(2, 4),
//                     FlSpot(3, 2),
//                     FlSpot(4, 5),
//                     FlSpot(5, 1),
//                     FlSpot(6, 4),
//                   ],
//                   isCurved: true,
//                   color: Colors.blue,
//                   dotData: FlDotData(show: false),
//                   belowBarData: BarAreaData(show: false),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Graph extends StatefulWidget {
  const Graph({super.key});

  @override
  State<Graph> createState() => _GraphState();
}

class _GraphState extends State<Graph> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  height: 400,
                  child: LineChart(
                    LineChartData(
                      gridData: FlGridData(show: false),
                      titlesData: FlTitlesData(show: false),
                      borderData: FlBorderData(
                        show: true,
                        border: Border.all(color: const Color(0xff37434d), width: 1),
                      ),
                      minX: 0,
                      maxX: 7,
                      minY: 0,
                      maxY: 6,
                      lineBarsData: [
                        LineChartBarData(
                          spots: [
                            FlSpot(0, 3),
                            FlSpot(1, 1),
                            FlSpot(2, 4),
                            FlSpot(3, 2),
                            FlSpot(4, 5),
                            FlSpot(5, 1),
                            FlSpot(6, 4),
                          ],
                          isCurved: true,
                          color: Colors.blue,
                          dotData: FlDotData(show: false),
                          belowBarData: BarAreaData(show: false),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 300,
                  child: Center(
                    child: PieChart(
                      PieChartData(
                        sectionsSpace: 0,
                        centerSpaceRadius: 40,
                        sections: [
                          PieChartSectionData(
                            value: 40,
                            color: Colors.blue,
                            title: '40%',
                            radius: 80,
                            titleStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
                          ),
                          PieChartSectionData(
                            value: 30,
                            color: Colors.green,
                            title: '30%',
                            radius: 70,
                            titleStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
                          ),
                          PieChartSectionData(
                            value: 15,
                            color: Colors.red,
                            title: '15%',
                            radius: 60,
                            titleStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
                          ),
                          PieChartSectionData(
                            value: 15,
                            color: Colors.yellow,
                            title: '15%',
                            radius: 50,
                            titleStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
