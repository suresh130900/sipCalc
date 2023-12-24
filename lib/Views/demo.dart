// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';
// // import 'package:fl_chart/fl_chart.dart';
// //
// // class SIPCalculatorWidget extends StatefulWidget {
// //   @override
// //   _SIPCalculatorWidgetState createState() => _SIPCalculatorWidgetState();
// // }
// //
// // class _SIPCalculatorWidgetState extends State<SIPCalculatorWidget> {
// //   double monthlyInvestment = 1000.0;
// //
// //   double futureValue = 0.0;
// //   double totalInvested = 0.0;
// //   double totalReturns = 0.0;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       mainAxisAlignment: MainAxisAlignment.center,
// //       crossAxisAlignment: CrossAxisAlignment.stretch,
// //       children: [
// //         _buildTextField(
// //           'Monthly Investment',
// //           monthlyInvestment,
// //               (text) {
// //             double parsedValue = double.tryParse(text) ?? 0.0;
// //             setState(() {
// //               monthlyInvestment = parsedValue;
// //               calculateFutureValue();
// //             });
// //           },
// //           maxLength: 6,
// //         ),
// //         SizedBox(height: 20),
// //         Row(
// //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //           children: [
// //             _buildStatCard('Total Invested', totalInvested),
// //             _buildStatCard('Expected Returns', totalReturns),
// //           ],
// //         ),
// //         SizedBox(height: 20),
// //         Expanded(
// //           child: PieChart(
// //             PieChartData(
// //               sections: [
// //                 PieChartSectionData(
// //                   color: Colors.blue,
// //                   value: totalInvested,
// //                   title: '\$${totalInvested.toStringAsFixed(2)}',
// //                   radius: 70,
// //                   titleStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
// //                 ),
// //                 PieChartSectionData(
// //                   color: Colors.green,
// //                   value: totalReturns,
// //                   title: '\$${totalReturns.toStringAsFixed(2)}',
// //                   radius: 70,
// //                   titleStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
// //                 ),
// //               ],
// //               borderData: FlBorderData(show: false),
// //               centerSpaceRadius: 0,
// //               sectionsSpace: 0,
// //             ),
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// //
// //   Widget _buildTextField(String label, double value, ValueChanged<String> onChanged, {required int maxLength}) {
// //     return Column(
// //       children: [
// //         Text(label),
// //         TextField(
// //           keyboardType: TextInputType.number,
// //           inputFormatters: [
// //             FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}$')),
// //             LengthLimitingTextInputFormatter(maxLength),
// //           ],
// //           controller: TextEditingController(
// //             text: value.toString(),
// //           ),
// //           onChanged: onChanged,
// //         ),
// //       ],
// //     );
// //   }
// //
// //   Widget _buildStatCard(String title, double value) {
// //     return Card(
// //       elevation: 4,
// //       child: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           children: [
// //             Text(
// //               title,
// //               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// //             ),
// //             SizedBox(height: 8),
// //             Text(
// //               '\$${value.toStringAsFixed(2)}',
// //               style: TextStyle(fontSize: 16, color: Colors.blue),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   void calculateFutureValue() {
// //     double monthlyRate = 0.01; // Assume a constant monthly rate for simplicity
// //     int totalMonths = 60; // Assuming 5 years for simplicity
// //
// //     double futureValue = 0.0;
// //     double totalInvested = 0.0;
// //     double totalReturns = 0.0;
// //
// //     for (int i = 0; i < totalMonths; i++) {
// //       futureValue = (futureValue + monthlyInvestment) * (1 + monthlyRate);
// //       totalInvested += monthlyInvestment;
// //       totalReturns = futureValue - totalInvested;
// //     }
// //
// //     setState(() {
// //       this.futureValue = futureValue;
// //       this.totalInvested = totalInvested;
// //       this.totalReturns = totalReturns;
// //     });
// //   }
// // }
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:fl_chart/fl_chart.dart';
//
// class SIPCalculatorWidget extends StatefulWidget {
//   @override
//   _SIPCalculatorWidgetState createState() => _SIPCalculatorWidgetState();
// }
//
// class _SIPCalculatorWidgetState extends State<SIPCalculatorWidget> {
//   TextEditingController monthlyInvestmentController = TextEditingController();
//   TextEditingController annualReturnController = TextEditingController();
//   TextEditingController investmentDurationController = TextEditingController();
//
//   double futureValue = 0.0;
//   double totalInvested = 0.0;
//   double totalReturns = 0.0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         _buildTextField(
//           'Monthly Investment',
//           monthlyInvestmentController,
//           onChanged: (text) {
//             calculateFutureValue();
//           },
//           maxLength: 6,
//         ),
//         _buildTextField(
//           'Expected Annual Return (%)',
//           annualReturnController,
//           onChanged: (text) {
//             calculateFutureValue();
//           },
//           maxLength: 5,
//         ),
//         _buildTextField(
//           'Investment Duration (in years)',
//           investmentDurationController,
//           onChanged: (text) {
//             calculateFutureValue();
//           },
//           maxLength: 2,
//         ),
//         SizedBox(height: 20),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             _buildStatCard('Total Invested', totalInvested),
//             _buildStatCard('Expected Returns', totalReturns),
//           ],
//         ),
//         SizedBox(height: 20),
//         Expanded(
//           child: PieChart(
//             PieChartData(
//               sections: [
//                 PieChartSectionData(
//                   color: Colors.blue,
//                   value: totalInvested,
//                   title: '\$${totalInvested.toStringAsFixed(2)}',
//                   radius: 70,
//                   titleStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
//                 ),
//                 PieChartSectionData(
//                   color: Colors.green,
//                   value: totalReturns,
//                   title: '\$${totalReturns.toStringAsFixed(2)}',
//                   radius: 70,
//                   titleStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
//                 ),
//               ],
//               borderData: FlBorderData(show: false),
//               centerSpaceRadius: 0,
//               sectionsSpace: 0,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildTextField(String label, TextEditingController controller, {required ValueChanged<String> onChanged, required int maxLength}) {
//     return Column(
//       children: [
//         Text(label),
//         TextField(
//           keyboardType: TextInputType.number,
//           inputFormatters: [
//             FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}$')),
//             LengthLimitingTextInputFormatter(maxLength),
//           ],
//           controller: controller,
//           onChanged: onChanged,
//         ),
//       ],
//     );
//   }
//
//   Widget _buildStatCard(String title, double value) {
//     return Card(
//       elevation: 4,
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Text(
//               title,
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 8),
//             Text(
//               '\$${value.toStringAsFixed(2)}',
//               style: TextStyle(fontSize: 16, color: Colors.blue),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void calculateFutureValue() {
//     double monthlyInvestment = double.tryParse(monthlyInvestmentController.text) ?? 0.0;
//     double annualReturn = double.tryParse(annualReturnController.text) ?? 0.0;
//     double investmentDuration = double.tryParse(investmentDurationController.text) ?? 0.0;
//
//     double monthlyRate = (annualReturn / 100) / 12;
//     int totalMonths = (investmentDuration * 12).toInt();
//
//     double futureValue = 0.0;
//     double totalInvested = 0.0;
//     double totalReturns = 0.0;
//
//     for (int i = 0; i < totalMonths; i++) {
//       futureValue = (futureValue + monthlyInvestment) * (1 + monthlyRate);
//       totalInvested += monthlyInvestment;
//       totalReturns = futureValue - totalInvested;
//     }
//
//     setState(() {
//       this.futureValue = futureValue;
//       this.totalInvested = totalInvested;
//       this.totalReturns = totalReturns;
//     });
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:url_launcher/url_launcher.dart';

class SIPCalculatorWidget extends StatefulWidget {
  @override
  _SIPCalculatorWidgetState createState() => _SIPCalculatorWidgetState();
}

class _SIPCalculatorWidgetState extends State<SIPCalculatorWidget> {
  TextEditingController monthlyInvestmentController = TextEditingController();
  TextEditingController annualReturnController = TextEditingController();
  TextEditingController investmentDurationController = TextEditingController();

  double futureValue = 0.0;
  double totalInvested = 0.0;
  double totalReturns = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildTextField(
          'Monthly Investment',
          monthlyInvestmentController,
          onChanged: (text) {
            calculateFutureValue();
          },
          maxLength: 6,
        ),
        _buildTextField(
          'Expected Annual Return (%)',
          annualReturnController,
          onChanged: (text) {
            calculateFutureValue();
          },
          maxLength: 5,
        ),
        _buildTextField(
          'Investment Duration (in years)',
          investmentDurationController,
          onChanged: (text) {
            calculateFutureValue();
          },
          maxLength: 2,
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildStatCard('Total Invested', totalInvested),
            _buildStatCard('Expected Returns', totalReturns),
          ],
        ),
        SizedBox(height: 20),
        Expanded(
          child: PieChart(
            PieChartData(
              sections: [
                PieChartSectionData(
                  color: Colors.blue,
                  value: totalInvested,
                  title: '\$${totalInvested.toStringAsFixed(2)}',
                  radius: 70,
                  titleStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
                ),
                PieChartSectionData(
                  color: Colors.green,
                  value: totalReturns,
                  title: '\$${totalReturns.toStringAsFixed(2)}',
                  radius: 70,
                  titleStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
                ),
              ],
              borderData: FlBorderData(show: false),
              centerSpaceRadius: 0,
              sectionsSpace: 0,
            ),
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            _launchWebsite('https://cashrich.com/');
          },
          child: Text('Go to Website'),
        ),
      ],
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {required ValueChanged<String> onChanged, required int maxLength}) {
    return Column(
      children: [
        Text(label),
        TextField(
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}$')),
            LengthLimitingTextInputFormatter(maxLength),
          ],
          controller: controller,
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget _buildStatCard(String title, double value) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '\$${value.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 16, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }

  void calculateFutureValue() {
    double monthlyInvestment = double.tryParse(monthlyInvestmentController.text) ?? 0.0;
    double annualReturn = double.tryParse(annualReturnController.text) ?? 0.0;
    double investmentDuration = double.tryParse(investmentDurationController.text) ?? 0.0;

    double monthlyRate = (annualReturn / 100) / 12;
    int totalMonths = (investmentDuration * 12).toInt();

    double futureValue = 0.0;
    double totalInvested = 0.0;
    double totalReturns = 0.0;

    for (int i = 0; i < totalMonths; i++) {
      futureValue = (futureValue + monthlyInvestment) * (1 + monthlyRate);
      totalInvested += monthlyInvestment;
      totalReturns = futureValue - totalInvested;
    }

    setState(() {
      this.futureValue = futureValue;
      this.totalInvested = totalInvested;
      this.totalReturns = totalReturns;
    });
  }

  void investNow() async {
    // URL scheme for CashRich
    const String cashRichScheme = 'cashrich://';

    // Check if CashRich app is installed
    if (await canLaunch(cashRichScheme)) {
      // Open CashRich app
      await launch(cashRichScheme);
    } else {
      // CashRich app is not installed, redirect to Play Store
      const String playStoreUrl = 'https://play.google.com/store/apps/details?id=com.example.cashrich';

      if (await canLaunch(playStoreUrl)) {
        await launch(playStoreUrl);
      } else {
        // Unable to launch Play Store
        print('Unable to launch Play Store.');
      }
    }
  }

  _launchWebsite(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

