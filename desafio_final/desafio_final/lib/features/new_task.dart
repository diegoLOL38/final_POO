import 'package:desafio_final/features/home.dart';
import 'package:desafio_final/interfaces/page_model.dart';
import 'package:desafio_final/models/gym_model_task.dart';
import 'package:desafio_final/models/personal_task_model.dart';
import 'package:desafio_final/models/watch_show_model.dart';
import 'package:desafio_final/utils/clean.dart';
import 'package:desafio_final/utils/read.dart';
import 'package:desafio_final/utils/tasks.dart';

late int woorkout;
late Workout workoutvalue;

late int shoow;
late Show showvalue;

late int plaace;
late Place placevalue;

class NewTask implements Page {
  @override
  void init() {
    Clean.screen();

    print("Qual tarefa deseja cadastrar");
    print("1 - Academia");
    print("2 - Assistir algo");
    print("3 - Outro");

    final option = Read.readInt();

    if (option == 1) {
      String name = Read.readString(message: "Digite o titulo?");
      String description = Read.readString(message: "Digite descrição");

      do {
        print("Escolha o Treino do dia");
        print("1 - Abdomem");
        print("2 - Biceps e Costas");
        print("3 - Peito");
        print("4 - Pernas");
        print("5 - Triceps");
        woorkout = Read.readInt();
        switch (woorkout) {
          case 1:
            workoutvalue = Workout.abs;
            break;
          case 2:
            workoutvalue = Workout.bicepsAndBack;
            break;
          case 3:
            workoutvalue = Workout.chest;
            break;
          case 4:
            workoutvalue = Workout.legs;
            break;
          case 5:
            workoutvalue = Workout.triceps;
            break;
          default:
            Clean.screen();
        }
      } while (woorkout < 1 || woorkout > 5);

      final gymModel = GymTaskModel(
          day: "26/08/2022",
          description: description,
          finished: false,
          name: name,
          workout: workoutvalue);

      tasks.add(gymModel);

      Home().init();
    } else if (option == 2) {
      String name = Read.readString(message: "Digite o titulo?");
      String description = Read.readString(message: "Digite descrição");
      String showName = Read.readString(message: "Digite o nome do show");

      do {
        print("Escolha o tipo de coisa que irá assistir");
        print("1 - Anime");
        print("2 - Filme");
        print("3 - Série");
        shoow = Read.readInt();
        switch (shoow) {
          case 1:
            showvalue = Show.anime;
            break;
          case 2:
            showvalue = Show.movie;
            break;
          case 3:
            showvalue = Show.serie;
            break;
          default:
            Clean.screen();
        }
      } while (shoow < 1 || shoow > 3);

      do {
        print("Escolha o lugar que irá assistir");
        print("1 - Casa");
        print("2 - Cinema");
        plaace = Read.readInt();
        switch (plaace) {
          case 1:
            placevalue = Place.home;
            break;
          case 2:
            placevalue = Place.movieTheater;
            break;
          default:
            Clean.screen();
        }
      } while (plaace < 1 || plaace > 2);

      final showModel = WatchShowModel(
          day: "26/08/2022",
          description: description,
          finished: false,
          name: name,
          show: showvalue,
          place: placevalue,
          showName: showName);
      tasks.add(showModel);

      Home().init();
    } else if (option == 3) {
      String name = Read.readString(message: "Digite o titulo?");
      String description = Read.readString(message: "Digite descrição");

      final personalModel = PersonalTaskModel(
          day: "26/08/2022",
          description: description,
          finished: false,
          name: name);
      tasks.add(personalModel);

      Home().init();
    }
  }
}
