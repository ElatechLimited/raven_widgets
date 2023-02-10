mixin FormValidations {
  //password valiations
  String? passwordValidation(String? password) {
    if (password!.trim().length < 8) {
      return "Password too short. Please provide a valid password";
    }
    return null;
  }

//confirm password validation
  String? confirmPasswordValiation(String password, String confirm) {
    if (password.trim() != confirm.trim()) {
      return "Password do not match. Please confirm password";
    }
    return null;
  }

//confirm pin validation
  String? pinValidation(String? pin) {
    if (pin!.trim().length < 6) {
      return "Pin to short";
    }
    return null;
  }

  //confirm pin validation
  String? sixDigitPinValidation(String? pin) {
    if (pin!.trim().length < 6) {
      return "Enter your 6 digit pin";
    }
    return null;
  }

//name validations
  String? nameValidation(String? value, {int limit = 3}) {
    if (value!.trim().length < limit) {
      return "Please enter a valid input";
    }
    return null;
  }

  //name validations
  String? usernameValidation(String? value, {int limit = 3}) {
    if (value!.trim().length < limit) {
      return "Please enter a valid input";
    }

    if (value.contains(' ')) {
      return "Spaces are not allowed in @usernames";
    }
    return null;
  }

  //address validations
  String? addressValidation(String? value) {
    if (value!.trim().length < 10) {
      return "Please enter a valid address";
    }
    return null;
  }

  //phone number validations
  String? phoneValidation(String? value) {
    if (value!.trim().length < 10) {
      return "Please enter a valid phone number";
    }
    return null;
  }

//RC Number validation
  String? rcNumberValidation(String? value) {
    if (value!.trim().length < 4) {
      return "Invalid RC Number";
    }
    return null;
  }

//email validation
  String? emailValidation(String? email) {
    RegExp regExp = RegExp(
        r'''(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])''');
    if (!regExp.hasMatch(email ?? "")) {
      return "Invaid email. Please provide a valid email address";
    }
    return null;
  }
}
