import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:unaerp_swim_team/pages/graphics/graphics_state.dart';

class GraphicsController extends ChangeNotifier {
  GlobalKey<FormState> dialogFormKey = GlobalKey<FormState>();

  final GraphicsState state = GraphicsState();

  GraphicsController() {
    buildGraphic('b9111b0e-b8a5-4920-a536-70cf07dbdae6');
  }

  void setAtlhetesWithLaps(final Map<String, List<int>> atlhetesWithLaps) {
    state.atlhetesWithLaps = atlhetesWithLaps;
  }

  void buildGraphic(final String workoutId) async {
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

                atlhetesWithLaps[element['athlete']] = lapsArray.map((dynamic lap) => lap as int).toList();
              }
            }

        return atlhetesWithLaps;
      });
    } catch (e) {
      debugPrint('Erro ao construir gráfico: $e');
      rethrow;
    }
  }
}