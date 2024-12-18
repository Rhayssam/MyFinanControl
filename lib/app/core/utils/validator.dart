class Validator {
  Validator._();

  static String? validateName(String? value) {
    final condition = RegExp(r"^[A-Z]([a-zA-Z]|\.| |-')+$");
    if (value != null && value.isEmpty) {
      return 'Esse campo não pode ser vazio.';
    }
    if (value != null && !condition.hasMatch(value)) {
      return 'Nome inválido. Digite um nome válido';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    final condition = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    if (value != null && value.isEmpty) {
      return 'Esse campo não pode ser vazio.';
    }
    if (value != null && !condition.hasMatch(value)) {
      return 'Email inválido. Digite um Email válido';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    final condition =
        RegExp(r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$");
    if (value != null && value.isEmpty) {
      return 'Esse campo não pode ser vazio.';
    }
    if (value != null && !condition.hasMatch(value)) {
      return 'Senha inválida. Digite uma senha válida';
    }
    return null;
  }

  static String? validateConfirmPassword(String? first, String? second) {
    if (first != second) {
      return 'As senhas devem ser iguais';
    }
    return null;
  }
}
