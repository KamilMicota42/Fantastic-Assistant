import 'package:fantastic_assistant/models/characters/character.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentCharacter extends Cubit<Character?> {
  CurrentCharacter() : super(null);

  void set(Character? character) {
    emit(character);
  }

  void delete() {
    emit(null);
  }
}
