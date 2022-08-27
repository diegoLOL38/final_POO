import 'package:desafio_final/models/gym_model_task.dart';
import 'package:desafio_final/models/personal_task_model.dart';
import 'package:desafio_final/models/watch_show_model.dart';

import '../interfaces/task_interface.dart';

List<TaskInterface> tasks = [
  GymTaskModel(
      day: "23/05/2022",
      name: "Treino",
      description: "Treinar para construir o corpo",
      finished: false,
      workout: Workout.chest),
  WatchShowModel(
    day: "25/05/2022",
    name: "Assistir",
    showName: "Dragon ball Z",
    description: "Assistir algo para passar o tempo",
    finished: false,
    show: Show.anime,
    place: Place.home,
  ),
  PersonalTaskModel(
    day: "26/07/2022",
    name: "Corsa",
    description: "Rebaixar o corsa",
    finished: false,
  )
];
