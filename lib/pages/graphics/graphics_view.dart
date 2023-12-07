import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'graphics_controller.dart';

class GraphicsView extends StatelessWidget {
  GraphicsView({super.key});

  final GraphicsController controller = GraphicsController();

  List<Widget> getAxisNameWidget() {
    List<Text> names = [];

    controller.state.atlhetesWithLaps.forEach((key, value) {
      if (!names.contains(key)) names.add(Text(key));
    });

    return names;
  }

  List<BarChartRodData> getData() {
    final List<BarChartRodData> roadData = [];
    double totalMilliseconds = 0;

    controller.state.atlhetesWithLaps.forEach((key, value) {
      for (var element in value) {
        totalMilliseconds += element;
      }

      roadData.add(
          BarChartRodData(
            fromY: 0,
            toY: totalMilliseconds / 60000
          )
      );

      totalMilliseconds = 0;
    });

    return roadData;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => controller,
        child: Consumer<GraphicsController>(
            builder: (context, controller, child) => Center(
              child: BarChart(
                  BarChartData(
                      minY: 0,
                      maxY: 30,
                      titlesData: FlTitlesData(
                          bottomTitles: AxisTitles(
                            axisNameWidget: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: getAxisNameWidget()
                            )
                          )
                      ),
                      barGroups: [
                        BarChartGroupData(
                            x: 0,
                            barsSpace: 4.0 * 6.0,
                            barRods: getData()
                        )
                      ]
                  )
              ),
            )
        )
    );
  }
}
