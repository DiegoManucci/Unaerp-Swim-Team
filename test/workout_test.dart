import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unaerp_swim_team/pages/create_workout/create_workout_controller.dart';

void main() {
  test('Testando o método saveWorkout', () async {
    // Cria uma instância mock de FirebaseFirestore para não alterar dados reais
    final firestoreMock = FakeFirebaseFirestore();
    final createWorkoutController = CreateWorkoutController();

    createWorkoutController.saveWorkout('Descrição do Treino', DateTime.now(), firestoreMock.collection('workouts'));

    // Obtendo os documentos da coleção mockada
    final documents = await firestoreMock.collection('workouts').get();

    // Verificando se há um documento na coleção
    expect(documents.docs.length, 1);

    // Obtendo os dados do documento
    final workoutData = documents.docs.first.data();

    // Verificando se a descrição do treino está correta
    expect(workoutData['description'], 'Descrição do Treino');
  });
}