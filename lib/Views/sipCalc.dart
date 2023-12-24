import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sip_calc/classes/language_constant.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SipCalc extends StatefulWidget {
  const SipCalc({super.key});

  @override
  State<SipCalc> createState() => _SipCalcState();
}

class _SipCalcState extends State<SipCalc> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  //making the controllers for the TextFields
  TextEditingController monthlyInvestmentController = TextEditingController();
  TextEditingController annualInterestRateController = TextEditingController();
  TextEditingController timePeriodController = TextEditingController();

  double futureValue = 0.0;
  double totalInvested = 0.0;
  double totalReturns = 0.0;

  //calculating the returns
  void calculateReturns() {
    double monthlyInvestment =
        double.tryParse(monthlyInvestmentController.text) ?? 0.0;
    double annualReturn =
        double.tryParse(annualInterestRateController.text) ?? 0.0;
    double investmentDuration =
        double.tryParse(timePeriodController.text) ?? 0.0;

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

    print(
        "-------------------------------------------------------------------");
    print(futureValue);
    print(totalReturns);
    print(totalReturns);

    setState(() {
      this.futureValue = futureValue;
      this.totalInvested = totalInvested;
      this.totalReturns = totalReturns;
    });
  }


  final Uri _url = Uri.parse('https://flutter.dev');

  Future<void> _launchUrl() async {
    print(_url);
    if (!await launchUrl(_url)) {
      print("-------------------------------------------------------");
      print("Cannot launch the URL");
      throw Exception('Could not launch $_url');
    }
    else{
      print("No Error detected");
      await launchUrl(_url);
    }
  }

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
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _Text("Monthly Investment", 20, FontWeight.w700),
            _SizedBox(20),
            TextField(
              maxLength: 6,
              controller: monthlyInvestmentController,
              keyboardType: TextInputType.number,
              onChanged: (text) {
                calculateReturns();
              },
              decoration: InputDecoration(
                labelText: 'Enter Your Monthly Investment',
                labelStyle: TextStyle(fontSize: 20),
                prefixIcon: Icon(Icons.currency_rupee),
                border: OutlineInputBorder(),
              ),
            ),
            _SizedBox(10),
            _Text("Expected Return Rate(P.a) ", 20, FontWeight.w700),
            _SizedBox(20),
            TextField(
              onChanged: (text) {
                calculateReturns();
              },
              maxLength: 2,
              controller: annualInterestRateController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: 'Enter Your Annual Interest rate',
                  labelStyle: TextStyle(fontSize: 16),
                  suffixIcon: Icon(
                    CupertinoIcons.percent,
                    size: 23,
                  ),
                  border: OutlineInputBorder(),
              ),
            ),
            _SizedBox(10),
            _Text("Time Period", 20, FontWeight.w700),
            _SizedBox(20),
            TextField(
              onChanged: (text) {
                calculateReturns();
              },
              maxLength: 2,
              controller: timePeriodController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter Your Time Period',
                labelStyle: TextStyle(fontSize: 16),
                suffix: Text(
                  "Yr",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                border: OutlineInputBorder(),
              ),
            ),
            _SizedBox(20),
            _buildCards("Invested Amount", totalInvested),
            _SizedBox(20),
            _buildCards("Est. returns", totalReturns),
            _SizedBox(20),
            _buildCards("Total Value", futureValue),
            _SizedBox(20),
            SizedBox(
              height: 300,
                child: PieChart(
                  PieChartData(
                    sections: [
                      PieChartSectionData(
                        color: Colors.lightBlue,
                        value: totalInvested,
                        radius: 120,
                        title: 'Rs ${totalInvested.toStringAsFixed(1)}',
                        titleStyle: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          color: Colors.grey[900],
                        ),
                      ),
                      PieChartSectionData(
                        color: Colors.greenAccent,
                        value: totalReturns,
                        radius: 140,
                        title: 'Rs ${totalReturns.toStringAsFixed(1)}',
                        titleStyle: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          color: Colors.grey[900],
                        ),
                      ),
                    ]
                  ),
                ),
              ),
            ElevatedButton(
              onPressed: () {
                //_launchWebsite('https://cashrich.com/');
                //_launchUrl;
                launchUrl(Uri.parse("https://cashrich.com/"));
              },
              child: const Text("Invest Now"),
            ),
            _Text(translation(context).homePage, 20, FontWeight.w700)
          ],
        ),
      ),
    );
  }
}

Widget _buildCards(String title, double value) {
  return Card(
    elevation: 2,
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          const Spacer(),
          const Text(
            "Rs ",
            style: TextStyle(
                fontSize: 20, color: Colors.blue, fontWeight: FontWeight.w700),
          ),
          Text(
            value.toStringAsFixed(2),
            style: const TextStyle(
                fontSize: 20, color: Colors.blue, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    ),
  );
}

Widget _SizedBox(double value) {
  return SizedBox(
    height: value,
  );
}

Widget _Text(String data, double FontSize, FontWeight) {
  return Text(
    data,
    style: TextStyle(
      fontSize: FontSize,
      fontWeight: FontWeight,
    ),
  );
}
