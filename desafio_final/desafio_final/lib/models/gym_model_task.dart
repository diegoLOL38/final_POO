import 'package:desafio_final/interfaces/task_interface.dart';
import 'package:desafio_final/utils/read.dart';

enum Workout {
  legs,
  bicepsAndBack,
  chest,
  abs,
  triceps,
}

class GymTaskModel implements TaskInterface {
  GymTaskModel({
    required this.day,
    required this.description,
    required this.finished,
    required this.name,
    required this.workout,
  });

  late Workout workout;

  @override
  String day;

  @override
  String description;

  @override
  bool finished;

  @override
  String name;

  @override
  void finish() {
    if (finished == true) {
      print("Tarefa já foi finalizada");
      Read.readString(message: "Pressione para continuar");
    } else {
      finished = true;
    }
  }
}
