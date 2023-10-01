import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentCharacterId extends Cubit<String?> {
  CurrentCharacterId() : super(null);

  void setId(String? currCharacterId) {
    emit(currCharacterId);
  }

  void deleteId() {
    emit(null);
  }
}
