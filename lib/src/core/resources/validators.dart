import 'package:todo/generated/l10n.dart';

class Validators {
  static String? descriptionValidator(String? s) {
    if (s == null || s.isEmpty) {
      return S.current.descriptionIsRequired;
    }
    if (s.length < 4) {
      return S.current.descriptionMustBeAtLeastCharacters(4);
    }
    return null;
  }

  static String? nameValidator(String? s) {
    if (s == null || s.isEmpty) {
      return S.current.nameIsRequired;
    }
    if (s.length < 4) {
      return S.current.nameMustBeAtLeastCharacters(4);
    }
    return null;
  }

  static String? passwordValidator(String? s) {
    if (s == null || s.isEmpty) {
      return S.current.passwordIsRequired;
    }
    if (s.length < 6) {
      return S.current.passwordMustBeAtLeastCharacters(6);
    }
    return null;
  }

  static String? emailValidator(String? s) {
    if (s == null || s.isEmpty) {
      return S.current.emailIsRequired;
    }
    if (!s.contains('@')) {
      return S.current.emailMustContainAtSign;
    }
    return null;
  }

  static String? titleValidator(String? s) {
    if (s == null || s.isEmpty) {
      return S.current.titleCannotBeEmpty;
    }
    if (s.length < 4) {
      return S.current.titleMustBeAtLeastCharacters(4);
    }
    return null;
  }
}
