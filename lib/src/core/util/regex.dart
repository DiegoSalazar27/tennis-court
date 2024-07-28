final RegExp emailRegex = RegExp(
  r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
);

bool emailValidator(String email) {
  return emailRegex.hasMatch(email);
}
