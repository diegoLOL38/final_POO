import 'package:desafio_final/interfaces/task_interface.dart';
import 'package:desafio_final/utils/read.dart';

enum Show {
  anime,
  movie,
  serie,
}

enum Place {
  home,
  movieTheater,
}

class WatchShowModel implements TaskInterface {
  WatchShowModel({
    required this.day,
    required this.description,
    required this.finished,
    required this.name,
    required this.show,
    required this.place,
    required this.showName,
  });

  String showName;

  late Show show;

  late Place place;

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
