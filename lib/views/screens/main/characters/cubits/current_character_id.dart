import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentCharacterId extends Cubit<String?> {
  CurrentCharacterId() : super(null);

  void set(String characterId) {
    emit(characterId);
  }

  void delete() {
    emit(null);
  }
}
