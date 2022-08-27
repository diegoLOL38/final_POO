import 'package:desafio_final/interfaces/page_model.dart';
import 'package:desafio_final/interfaces/task_interface.dart';
import 'package:desafio_final/models/gym_model_task.dart';
import 'package:desafio_final/models/watch_show_model.dart';
import 'package:desafio_final/utils/clean.dart';
import 'package:desafio_final/utils/tasks.dart';
import 'package:desafio_final/features/home.dart';

import '../utils/read.dart';

late int optioon;

class Taskees implements Page {
  @override
  void init() {
    Clean.screen();

    if (tasks.isEmpty) {
      print("Sem tarefas...");
    }

    for (int i = 0; i < tasks.length; i++) {
      final taskks = tasks[i];
      _showTitle(taskks, i);
      if (taskks is GymTaskModel) {
        _gymInfo(taskks);
      }
      if (taskks is WatchShowModel) {
        _watchShowInfo(taskks);
      }
    }
    print("----------");
    print("Pressione 1 para finalizar uma tarefa");
    print("Pressione 2 para deletar uma tarefa");
    print("Pressione 3 para Sair");
    optioon = Read.readInt();
    switch (optioon) {
      case 1:
        finalizeTask();
        break;
      case 2:
        deleteTask();
        break;
      case 3:
        print("saindo");
        break;
      default:
        Clean.screen();
        init();
    }

    Read.readString(message: 'Clique para voltar pro menu inicial');

    Home().init();
  }

  void finalizeTask() {
    print("----------");
    int taskIndex =
        Read.readInt(message: 'Selecione uma atividade para finalizar:');

    if (taskIndex < tasks.length && taskIndex > 0) {
      tasks[taskIndex].finish();
      init();
    }
  }

  void deleteTask() {
    print("----------");

    int taskIndex =
        Read.readInt(message: 'Selecione uma atividade para deletar:');

    if (taskIndex < tasks.length && taskIndex > 0) {
      tasks.removeAt(taskIndex);
      init();
    }
  }

  void _showTitle(TaskInterface taskks, int index) {
    print("----------");
    print("----------");
    print("----------");
    if (taskks.finished == true) {
      print("| x |");
    } else {
      print("|   |");
    }
    print("Código: $index");
    print("Titulo: ${taskks.name}");
    print("Descrição: ${taskks.description}");
  }

  void _gymInfo(GymTaskModel taskks) {
    print("Dia: ${taskks.day}");
    print("Workout: ${taskks.workout}");
  }

  void _watchShowInfo(WatchShowModel taskks) {
    print("Dia: ${taskks.day}");
    print("Nome do show: ${taskks.showName}");
    print("Tipo de midia: ${taskks.show}");
    print("Lugar assistido: ${taskks.place}");
  }
}
