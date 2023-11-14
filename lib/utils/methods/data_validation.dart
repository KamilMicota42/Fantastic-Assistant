bool isIntable(String s) {
  // ignore: unnecessary_null_comparison
  if (s == null) {
    return false;
  }
  return int.tryParse(s) != null;
}

bool isAttributeValid(String i) {
  if (isIntable(i)) {
    if (int.tryParse(i)! <= 30 && int.tryParse(i)! >= -30) {
      return true;
    } else {
      return false;
    }
  } else {
    return false;
  }
}
