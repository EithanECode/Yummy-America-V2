class Validators {
  // Validación de email
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingresa tu correo electrónico';
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Por favor ingresa un correo electrónico válido';
    }

    return null;
  }

  // Validación de contraseña
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingresa una contraseña';
    }

    if (value.length < 6) {
      return 'La contraseña debe tener al menos 6 caracteres';
    }

    return null;
  }

  // Validación de confirmación de contraseña
  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Por favor confirma tu contraseña';
    }

    if (value != password) {
      return 'Las contraseñas no coinciden';
    }

    return null;
  }

  // Validación de nombre
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingresa tu nombre';
    }

    if (value.length < 2) {
      return 'El nombre debe tener al menos 2 caracteres';
    }

    return null;
  }

  // Validación de teléfono
  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingresa tu teléfono';
    }

    // Remover espacios y caracteres especiales
    final cleanPhone = value.replaceAll(RegExp(r'[^\d]'), '');

    if (cleanPhone.length < 10) {
      return 'El teléfono debe tener al menos 10 dígitos';
    }

    return null;
  }

  // Validación de DNI
  static String? validateDNI(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingresa tu DNI';
    }

    // Remover espacios y caracteres especiales
    final cleanDNI = value.replaceAll(RegExp(r'[^\d]'), '');

    if (cleanDNI.length != 8) {
      return 'El DNI debe tener 8 dígitos';
    }

    return null;
  }

  // Validación de campo requerido
  static String? validateRequired(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return 'Por favor ingresa $fieldName';
    }

    return null;
  }

  // Validación de longitud mínima
  static String? validateMinLength(
    String? value,
    int minLength,
    String fieldName,
  ) {
    if (value == null || value.length < minLength) {
      return '$fieldName debe tener al menos $minLength caracteres';
    }

    return null;
  }

  // Validación de longitud máxima
  static String? validateMaxLength(
    String? value,
    int maxLength,
    String fieldName,
  ) {
    if (value != null && value.length > maxLength) {
      return '$fieldName no puede tener más de $maxLength caracteres';
    }

    return null;
  }

  // Validación de número
  static String? validateNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingresa un número';
    }

    if (double.tryParse(value) == null) {
      return 'Por favor ingresa un número válido';
    }

    return null;
  }

  // Validación de URL
  static String? validateURL(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingresa una URL';
    }

    final urlRegex = RegExp(
      r'^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$',
    );

    if (!urlRegex.hasMatch(value)) {
      return 'Por favor ingresa una URL válida';
    }

    return null;
  }
}
