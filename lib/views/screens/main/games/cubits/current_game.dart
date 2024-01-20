import 'package:fantastic_assistant/models/game_model/game_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentGameCubit extends Cubit<GameModel?> {
  CurrentGameCubit() : super(null);

  void set(GameModel newGame) {
    emit(newGame);
  }

  void delete() {
    emit(null);
  }
}
