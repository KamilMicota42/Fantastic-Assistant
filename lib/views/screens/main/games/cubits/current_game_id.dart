import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentGameId extends Cubit<String?> {
  CurrentGameId() : super(null);

  void set(String characterId) {
    emit(characterId);
  }

  void delete() {
    emit(null);
  }
}
