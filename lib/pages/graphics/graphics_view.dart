import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unaerp_swim_team/utils/utils.dart';

import 'graphics_controller.dart';

class GraphicsView extends StatelessWidget {
  GraphicsView({super.key});

  final GraphicsController controller = GraphicsController();
  final List<String> existingBottomTitles = [];
  final List<String> existingLeftTitles = [];

  Widget bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 10);

    String text = "";

    controller.state.atlhetesWithLaps.forEach((key, value) {
      if (!existingBottomTitles.contains(key)) {
        existingBottomTitles.add(key);
        text = key;

        return;
      }
    });

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    if (value == meta.max) {
      return Container();
    }

    const style = TextStyle(
      fontSize: 10,
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(
        meta.formattedValue,
        style: style,
      ),
    );
  }

  List<BarChartGroupData> getData(double barsWidth, double barsSpace) {
    final List<BarChartGroupData> groupData = [];
    double totalMilliseconds = 0;

    controller.state.atlhetesWithLaps.forEach((key, value) {
      for (var element in value) {
        totalMilliseconds += element;
      }

      groupData.add(
        BarChartGroupData(
            x: 0,
            barsSpace: barsSpace,
            barRods: [
              BarChartRodData(
                  toY: 30,
                  rodStackItems: [
                    BarChartRodStackItem(0, 5, Colors.black)
                  ],
                  borderRadius: BorderRadius.zero,
                  width: barsWidth
              )
            ]
        )
      );

      totalMilliseconds = 0;
    });

    return groupData;
  }


    @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;

    final barsSpace = 4.0 * maxWidth / 400;
    final barsWidth = 8.0 * maxWidth / 400;

    return ChangeNotifierProvider(
        create: (context) => controller,
        child: Consumer<GraphicsController>(
            builder: (context, controller, child) => Center(
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.center,
                  barTouchData: BarTouchData(enabled: false),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 28,
                        getTitlesWidget: bottomTitles
                      )
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: leftTitles,
                      ),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  gridData: FlGridData(
                    show: true,
                    checkToShowHorizontalLine: (value) => value % 10 == 0,
                    getDrawingHorizontalLine: (value) => const FlLine(
                      color: Colors.blue,
                      strokeWidth: 1,
                    ),
                    drawVerticalLine: false,
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  groupsSpace: barsSpace,
                  barGroups: getData(barsWidth, barsSpace),
                )
              ),
            )
        )
    );
  }
}
