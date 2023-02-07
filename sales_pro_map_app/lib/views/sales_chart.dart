import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:sales_pro_map_app/model/sales_model.dart';
import 'package:sales_pro_map_app/services/database_controller.dart';

class SalesChart extends StatefulWidget {
  const SalesChart({super.key});

  @override
  State<SalesChart> createState() => _SalesChartState();
}

class _SalesChartState extends State<SalesChart> {
  late int showingTooltip;
  @override
  void initState() {
    // TODO: implement initState
    showingTooltip = -1;
    super.initState();
  }

  BarChartGroupData generateGroupData(int x, int y) {
    return BarChartGroupData(
      x: x,
      showingTooltipIndicators: showingTooltip == x ? [0] : [],
      barRods: [
        BarChartRodData(
          toY: y.toDouble(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<Database>(context);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: AspectRatio(
            aspectRatio: .6,
            child: StreamBuilder<List<SalesModel>>(
              stream: db.sales(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active &&
                    snapshot.hasData) {
                      print(snapshot.data![0]);
                  return BarChart(
                  BarChartData(
                      barGroups: [
                        generateGroupData(
                            int.parse(snapshot.data![0].date.substring(0, 2)),
                            int.parse(snapshot.data![0].sales.toString())),
                        generateGroupData(
                            int.parse(snapshot.data![1].date.substring(0, 2)),
                            int.parse(snapshot.data![1].sales.toString())),
                      ],
                      barTouchData: BarTouchData(
                          enabled: true,
                          handleBuiltInTouches: false,
                          touchCallback: (event, response) {
                            if (response != null &&
                                response.spot != null &&
                                event is FlTapUpEvent) {
                              setState(() {
                                final x = response.spot!.touchedBarGroup.x;
                                final isShowing = showingTooltip == x;
                                if (isShowing) {
                                  showingTooltip = -1;
                                } else {
                                  showingTooltip = x;
                                }
                              });
                            }
                          },
                          mouseCursorResolver: (event, response) {
                            return response == null || response.spot == null
                                ? MouseCursor.defer
                                : SystemMouseCursors.click;
                          })),
                );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
