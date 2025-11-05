bool validateEmail(String value) {
  const pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9-]+\.[a-zA-Z]+";
  return RegExp(pattern).hasMatch(value);
}
