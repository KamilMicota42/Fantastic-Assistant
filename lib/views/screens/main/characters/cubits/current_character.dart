import 'package:fantastic_assistant/models/characters/character_model/character_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentCreateCharacterCubit extends Cubit<CharacterModel?> {
  CurrentCreateCharacterCubit() : super(null);

  void set(CharacterModel newCharacter) {
    emit(newCharacter);
  }

  void delete() {
    emit(null);
  }
}
