import 'package:fantastic_assistant/models/characters/character_model/character_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentCharacterCubit extends Cubit<CharacterModel?> {
  CurrentCharacterCubit() : super(null);

  void set(CharacterModel newCharacter) {
    emit(newCharacter);
  }

  void delete() {
    emit(null);
  }
}
