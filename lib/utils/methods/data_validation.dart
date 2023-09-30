bool isIntable(String s) {
  // ignore: unnecessary_null_comparison
  if (s == null) {
    return false;
  }
  return int.tryParse(s) != null;
}
