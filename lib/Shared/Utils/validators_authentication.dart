import 'regex.dart';

class EntriesValidator {
  static String? validateUsername(String? user) {
    if (user == null || user.isEmpty) {
      return "Campo Obrigatório";
    }
    if (user.isInvalidUser()) {
      return "Nome de Usuário inválido";
    }
    return null;
  }

  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return "Campo Obrigatório";
    }
    if (email.isInvalidEmail()) {
      return "Email inválido";
    }
    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return "Campo Obrigatório";
    }
    if (password.isInvalidPassword().isEmpty) {
      return null;
    }
    return password.isInvalidPassword().first;
  }

  static String? validateConfirmPassword(String? password) {
    if (password == null || password.isEmpty) {
      return "Campo Obrigatório";
    }
    return null;
  }

  static String? validatePhone(String? phone) {
    if (phone == null || phone.isEmpty) {
      return "Campo Obrigatório";
    }
    if (phone.isInvalidPhone()) {
      return "Número de Telefone inválido";
    }
    return null;
  }
}
