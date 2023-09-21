import 'package:covid19_tracker/Models/WorldStatesModel.dart';
import 'package:covid19_tracker/Services/WorldStateViewModel.dart';
import 'package:covid19_tracker/view/countries_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStatesScreen extends StatefulWidget {
  const WorldStatesScreen({super.key});

  @override
  State<WorldStatesScreen> createState() => _WorldStatesScreenState();
}

class _WorldStatesScreenState extends State<WorldStatesScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  WorldStateViewModel statesServices = WorldStateViewModel();

  final colorList = <Color>[
    Colors.blueAccent,
    Colors.amber,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
              FutureBuilder(
                future: statesServices.fetchWorldStatesRecords(),
                builder: (context, AsyncSnapshot<WorldStatesModel> snapshot) {
                  if (snapshot.hasData) {
                    return Expanded(
                      flex: 1,
                      child: SpinKitFadingCircle(
                        color: Colors.white,
                        size: 50.0,
                        controller: _controller,
                      ),
                    );
                  } else {
                    return Column(
                      children: [
                        PieChart(
                          dataMap: const {
                            "Infected": 200,
                            // double.parse(snapshot.data!.cases!.toString()),
                            "Recovered": 70,
                            // double.parse(
                            // snapshot.data!.recovered!.toString()),
                            "Deaths": 22,
                            // double.parse(snapshot.data!.deaths!.toString()),
                          },
                          chartValuesOptions: const ChartValuesOptions(
                            showChartValuesInPercentage: true,
                          ),
                          animationDuration: const Duration(milliseconds: 1200),
                          legendOptions: const LegendOptions(
                              legendPosition: LegendPosition.left),
                          chartRadius: MediaQuery.of(context).size.width / 2,
                          chartType: ChartType.disc,
                          // chartLegendSpacing: 32,
                          colorList: colorList,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).size.height * .06),
                          child: const Card(
                            child: Column(
                              children: [
                                ReusableRow(
                                    title: 'total', value: '2834907652'),
                                ReusableRow(
                                    title: 'Deaths', value: '2834907652'),
                                ReusableRow(
                                    title: 'Recovered', value: '2834907652'),
                                ReusableRow(
                                    title: 'Active', value: '2834907652'),
                                // ReusableRow(
                                //   title: 'Total',
                                //   value: snapshot.data!.cases!.toString(),
                                // ),
                                // Divider(),
                                // ReusableRow(
                                //   title: 'Deaths',
                                //   value: snapshot.data!.deaths!.toString(),
                                // ),
                                // Divider(),
                                // ReusableRow(
                                //   title: 'Recovered',
                                //   value: snapshot.data!.recovered!.toString(),
                                // ),
                                // Divider(),
                                // ReusableRow(
                                //   title: 'Active',
                                //   value: snapshot.data!.active!.toString(),
                                // ),
                                // Divider(),
                                // ReusableRow(
                                //   title: 'Critical',
                                //   value: snapshot.data!.critical!.toString(),
                                // ),
                                // // Divider(),
                                // // ReusableRow(
                                // //   title: 'Today Cases',
                                // //   value: snapshot.data!.todayCases!.toString(),
                                // // ),
                                // Divider(),
                                // ReusableRow(
                                //   title: 'Today Deaths',
                                //   value: snapshot.data!.todayDeaths!.toString(),
                                // ),
                                // Divider(),
                                // ReusableRow(
                                //   title: 'Today Recovered',
                                //   value:
                                //       snapshot.data!.todayRecovered!.toString(),
                                // ),
                                // Divider(),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CountriesListScreen()));
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text("Track Countries"),
                            ),
                          ),
                        )
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  final String title, value;
  const ReusableRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value),
            ],
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
