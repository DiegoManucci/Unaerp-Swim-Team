import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:unaerp_swim_team/pages/graphics/graphics_state.dart';
import 'package:unaerp_swim_team/pages/graphics/widgets/bar_data.dart';

import '../../types/workout.dart';
import '../../utils/utils.dart';

class GraphicsController extends ChangeNotifier {
  GlobalKey<FormState> dialogFormKey = GlobalKey<FormState>();

  final GraphicsState state = GraphicsState();

  GraphicsController() {
    fillWorkouts();
  }

  void setWorkouts (final List<Workout> workouts) {
    state.workouts = workouts;
  }

  void fillWorkouts() async {
    final List<Workout> workouts = await _getWorkouts();
    setWorkouts(workouts);
    notifyListeners();
  }

  Future<List<Workout>> _getWorkouts() {
    try {
      return FirebaseFirestore.instance
          .collection('workouts')
          .get()
          .then((value) {
        List<Workout> workouts = [];

        for (var element in value.docs) {
          workouts.add(
              Workout(
                  element.id,
                  element['description'],
                  DateTime.fromMillisecondsSinceEpoch(
                    (element['date'] as Timestamp).millisecondsSinceEpoch,
                  )
              )
          );
        }

        return workouts;
      });
    } catch (e) {
      debugPrint('Erro ao listar treinos: $e');
      rethrow;
    }
  }

  void selectWorkout (Workout? workout) {
    if (workout != null) fillAtlhetesWithLaps(workout.id!);
    notifyListeners();
  }

  //region Graphic Data

  BarChart getGraphic () {
    BarData myBarData = BarData();
    myBarData.initializeBarDate(state.atlhetesWithLaps);

    return BarChart(
        BarChartData(
          minY: 0,
          maxY: 3,
          gridData: const FlGridData(show: false),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            show: true,
            topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: getBottomTitles
              ),
            ),
          ),
          barGroups: myBarData.barData.map((data) => BarChartGroupData(
              x: data.x,
              barRods: [
                BarChartRodData(
                    toY: data.y,
                    color: const Color(0xFF3D5BA9),
                    width: 25,
                    borderRadius: BorderRadius.circular(4),
                    backDrawRodData: BackgroundBarChartRodData(
                        show: true,
                        toY: 3,
                        color: Colors.grey[200]
                    )
                )
              ]
          )).toList(),
        )
    );
  }

  void setAtlhetesWithLaps(final Map<String, List<int>> atlhetesWithLaps) {
    state.atlhetesWithLaps = atlhetesWithLaps;
  }

  void fillAtlhetesWithLaps(final String workoutId) async {
    final Map<String, List<int>> atlhetesWithLaps = await _getAthletesWithLapsByWorkoutId(workoutId);
    setAtlhetesWithLaps(atlhetesWithLaps);
    notifyListeners();
  }

  Future<Map<String, List<int>>> _getAthletesWithLapsByWorkoutId(final String workoutId) async {
    try {
      return await FirebaseFirestore.instance
          .collection('evaluations')
          .where('workout', isEqualTo: workoutId)
          .get()
          .then((value) {
            final Map<String, List<int>> atlhetesWithLaps = HashMap();

            for (var element in value.docs) {
              if (!atlhetesWithLaps.containsKey(element['athlete'])) {
                List<dynamic> lapsArray = element['laps'] ?? [];

                atlhetesWithLaps[element['athleteName']] = lapsArray.map((dynamic lap) => lap as int).toList();
              }
            }

        return atlhetesWithLaps;
      });
    } catch (e) {
      debugPrint('Erro ao construir gráfico: $e');
      rethrow;
    }
  }

  Widget getBottomTitles (double value, TitleMeta meta) {
    int contador = 0;
    double totalMilliseconds = 0;

    const style = TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.bold,
      fontSize: 10
    );

    Widget text = const Text("", style: style);

    state.atlhetesWithLaps.forEach((key, values) {
      for (var element in values) {
        totalMilliseconds += element;
      }

      totalMilliseconds = totalMilliseconds / values.length;

      if (contador == value.toInt()) {
        text = Text(
            key + " - " + Utils.formatTimeWithoutMilliseconds(totalMilliseconds.toInt()),
            style: style
        );
      }

      totalMilliseconds = 0;
      contador++;
    });

    return SideTitleWidget(axisSide: meta.axisSide, child: text);
  }

  //endregion
}