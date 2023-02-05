import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
          gradient: LinearGradient(colors: [Colors.white,Colors.green]),
          width: 10
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('sales'),),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: AspectRatio(
            aspectRatio: .8,
            child: BarChart(
              BarChartData(
                  barGroups: [
                    generateGroupData(1, 8),
                    generateGroupData(2, 20),
                    generateGroupData(3, 4),
                    generateGroupData(4, 6),
                      generateGroupData(5, 3),
                        generateGroupData(6, 25),
                          generateGroupData(7, 44),
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
            ),
          ),
        ),
      ),
    );
  }
}
