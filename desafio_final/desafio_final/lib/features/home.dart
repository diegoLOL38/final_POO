import 'package:desafio_final/features/new_task.dart';
import 'package:desafio_final/features/taskees.dart';
import 'package:desafio_final/interfaces/page_model.dart';
import 'package:desafio_final/utils/clean.dart';
import 'package:desafio_final/utils/read.dart';

class Home implements Page {
  @override
  void init() {
    Clean.screen();

    print("----------Lista de tarefas----------");
    print("[1] Cadastrar tarefas");
    print("[2] Tarefas/Finalizar");
    print("[3] Sair");

    final answer = Read.readInt(message: "Selecione opção: ");

    if (answer == 1) {
      NewTask().init();
    } else if (answer == 2) {
      Taskees().init();
    }
  }
}
