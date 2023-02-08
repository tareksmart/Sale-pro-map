import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:sales_pro_map_app/model/sales_model.dart';
import 'package:sales_pro_map_app/model/transactiom_model.dart';
import 'package:sales_pro_map_app/services/database_controller.dart';

class CreditChart extends StatefulWidget {
  const CreditChart({super.key});

  @override
  State<CreditChart> createState() => _CreditChartState();
}

class _CreditChartState extends State<CreditChart> {
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
      appBar: AppBar(
        title: Text('Credit chart'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(36),
                child: AspectRatio(
                  aspectRatio: .6,
                  child: StreamBuilder<List<TransModel>>(
                    stream: db.cedit(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.active &&
                          snapshot.hasData) {
                        final salesList = snapshot.data;

                        return BarChart(
                          BarChartData(
                              titlesData: FlTitlesData(
                                  show: true,
                                  topTitles: AxisTitles(
                                      axisNameWidget: Text(
                                    salesList![0].date.substring(3, 10) +
                                        " to " +
                                        salesList![salesList.length - 1]
                                            .date
                                            .substring(3, 10),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(color: Colors.blueAccent),
                                  ))),
                              barGroups: salesList
                                  ?.map((e) => generateGroupData(
                                      int.parse(e.date.substring(0, 2)),
                                      int.parse(e.mony.toString())))
                                  .toList(),
                              barTouchData: BarTouchData(
                                  enabled: true,
                                  handleBuiltInTouches: false,
                                  touchCallback: (event, response) {
                                    if (response != null &&
                                        response.spot != null &&
                                        event is FlTapUpEvent) {
                                      setState(() {
                                        final x =
                                            response.spot!.touchedBarGroup.x;
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
                                    return response == null ||
                                            response.spot == null
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
            ],
          ),
        ),
      ),
    );
  }
}
