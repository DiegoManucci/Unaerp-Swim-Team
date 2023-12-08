import 'individual_bar.dart';

class BarData {
  List<IndividualBar> barData = [];

  void initializeBarDate (final Map<String, List<int>> atlhetesWithLaps) {
    int index = 0;
    double totalMilliseconds = 0;
    double minutos = 0;

    atlhetesWithLaps.forEach((key, value) {
      for (var element in value) {
        totalMilliseconds += element;
      }

      minutos = (((totalMilliseconds) / 1000) / 60) / value.length;

      barData.add(
        IndividualBar(x: index, y: minutos)
      );

      totalMilliseconds = 0;
      minutos = 0;
      index++;
    });
  }
}